// cs_string.hh
// This file is part of libpbe; see http://anyterm.org/
// (C) 2007-2008 Philip Endecott

// Distributed under the Boost Software License, Version 1.0:
//
// Permission is hereby granted, free of charge, to any person or organization
// obtaining a copy of the software and accompanying documentation covered by
// this license (the "Software") to use, reproduce, display, distribute,
// execute, and transmit the Software, and to prepare derivative works of the
// Software, and to permit third-parties to whom the Software is furnished to
// do so, all subject to the following:
// 
// The copyright notices in the Software and this entire statement, including
// the above license grant, this restriction and the following disclaimer,
// must be included in all copies of the Software, in whole or in part, and
// all derivative works of the Software, unless such copies or derivative
// works are solely in the form of machine-executable object code generated by
// a source language processor.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
// SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
// FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

#ifndef libpbe_charset_cs_string_hh
#define libpbe_charset_cs_string_hh

#include "charset/charset_t.hh"
#include "charset/string_adaptor.hh"

#include <string>
#include <memory>


namespace pbe {

// String tagged with character set
// --------------------------------
//
// This class provides a string tagged with its character set.  It is
// implemented using a std::basic_string of the character set's unit_t
// and a string_adaptor.


// This base class is used so that ustr is constructed before it is
// passed by reference to string_adaptor.
template <typename unit_string_t>
struct cs_string_base {
  unit_string_t ustr_;
  cs_string_base() {}
  cs_string_base(unit_string_t u): ustr_(u) {}
  cs_string_base(const typename unit_string_t::pointer u): ustr_(u) {}
};


template< charset_t cset,
          typename Alloc = std::allocator< typename charset_traits<cset>::unit_t >
        >
class cs_string:
  private cs_string_base< typename string_adaptor<cset,Alloc>::unit_string_t >,
  public string_adaptor<cset,Alloc>
{
  typedef string_adaptor<cset,Alloc> adaptor;
  typedef cs_string_base< typename adaptor::unit_string_t > base;
  typedef typename charset_traits<cset>::unit_t unit_t;

public:
  cs_string(): adaptor(base::ustr_) {}
  cs_string(const unit_t* s): base(s), adaptor(base::ustr_) {}  // ???
  cs_string(const cs_string& other): base(other.unit_str()), adaptor(base::ustr_) {}
  cs_string(typename adaptor::size_type n, typename adaptor::value_type c): 
    adaptor(base::ustr_) {
    append(n,c);
  }
  template <class InputIterator>
  cs_string(InputIterator first, InputIterator last):
    adaptor(base::ustr_) { 
    append(first,last);
  }
};


template <charset_t cset, typename Alloc>
cs_string<cset, Alloc> operator+(const cs_string<cset, Alloc>& s1,
                                 const cs_string<cset, Alloc>& s2) {
  cs_string<cset,Alloc> s = s1;
  s.append(s2);
  return s;
}

template <charset_t cset, typename Alloc>
cs_string<cset, Alloc> operator+(typename charset_traits<cset>::char_t c,
                                 const cs_string<cset, Alloc>& s2) {
  cs_string<cset,Alloc> s = c;
  s.append(s2);
  return s;
}

template <charset_t cset, typename Alloc>
cs_string<cset, Alloc> operator+(const cs_string<cset, Alloc>& s1,
                                 typename charset_traits<cset>::char_t c) {
  cs_string<cset,Alloc> s = s1; 
  s.append(c);
  return s;
}


};

#endif