Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4R9dXWP021269
	for <linux-lvm@redhat.com>; Mon, 27 May 2013 05:39:33 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4R9dT4Y026871
	for <linux-lvm@redhat.com>; Mon, 27 May 2013 05:39:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 390C32003E1
	for <linux-lvm@redhat.com>; Mon, 27 May 2013 11:39:28 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id zCgWYowcw0Yn for <linux-lvm@redhat.com>;
	Mon, 27 May 2013 11:39:28 +0200 (CEST)
Received: from [192.168.7.142] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id D44872003DF
	for <linux-lvm@redhat.com>; Mon, 27 May 2013 11:39:27 +0200 (CEST)
Message-ID: <51A329CA.2010806@mglug.de>
Date: Mon, 27 May 2013 11:39:22 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080804000804080703090201"
Subject: [linux-lvm] thin-provisioning-tools failed compiling on Ubuntu 13.04
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------080804000804080703090201
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi lsit,

i wanted using thin-provisioned lvm-volumes on a new created Ubuntu
13.04-machine. Unfortunatly the needed thin-provisinoing-tools dont
compile anymore.

It seems to be a conflict between a boost-lib and the code
("range"-class ambigous). Im using libboost-dev 1.49.0.1.

Any hints to solve this? I appended the log. It is a intel core2duo
machine (64bit) with 3GB RAM.

Tfh!

Oliver


--------------080804000804080703090201
Content-Type: text/x-log;
 name="thin-provisioning-tools.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="thin-provisioning-tools.log"

    [CXX] thin-provisioning/thin_debug.cc
In file included from ./thin-provisioning/metadata.h:28:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/device_tree.h:42:45: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:28:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/device_tree.h:42:45: error: 'range' has not been declared
./thin-provisioning/device_tree.h:42:50: error: expected ',' or '...' before '<' token
./thin-provisioning/device_tree.h:46:4: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:28:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/device_tree.h:46:4: error: 'range' does not name a type
In file included from ./thin-provisioning/metadata.h:29:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/mapping_tree.h:76:45: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:29:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/mapping_tree.h:76:45: error: 'range' has not been declared
./thin-provisioning/mapping_tree.h:76:50: error: expected ',' or '...' before '<' token
./thin-provisioning/mapping_tree.h:80:4: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:29:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/mapping_tree.h:80:4: error: 'range' does not name a type
./thin-provisioning/mapping_tree.h:85:7: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:29:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/mapping_tree.h:85:7: error: 'range' has not been declared
./thin-provisioning/mapping_tree.h:85:12: error: expected ',' or '...' before '<' token
./thin-provisioning/mapping_tree.h:90:4: error: reference to 'range' is ambiguous
In file included from ./thin-provisioning/device_tree.h:5:0,
                 from ./thin-provisioning/metadata.h:28,
                 from thin-provisioning/thin_debug.cc:32:
./persistent-data/range.h:11:8: error: candidates are: template<class T> class base::range
In file included from /usr/include/boost/range/iterator_range_core.hpp:29:0,
                 from /usr/include/boost/range/iterator_range.hpp:13,
                 from /usr/include/boost/range/as_literal.hpp:22,
                 from /usr/include/boost/algorithm/string/classification.hpp:17,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/boost/range/algorithm/equal.hpp:150:5: error:                 namespace boost::range { }
In file included from ./thin-provisioning/metadata.h:29:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/mapping_tree.h:90:4: error: 'range' does not name a type
thin-provisioning/thin_debug.cc:46:11: error: reference to 'shared_ptr' is ambiguous
In file included from /usr/include/c++/4.7/bits/shared_ptr.h:52:0,
                 from /usr/include/c++/4.7/memory:87,
                 from /usr/include/boost/function/function_base.hpp:16,
                 from /usr/include/boost/function/detail/prologue.hpp:17,
                 from /usr/include/boost/function.hpp:24,
                 from /usr/include/boost/algorithm/string/detail/find_iterator.hpp:18,
                 from /usr/include/boost/algorithm/string/find_iterator.hpp:24,
                 from /usr/include/boost/algorithm/string/iter_find.hpp:27,
                 from /usr/include/boost/algorithm/string/split.hpp:16,
                 from thin-provisioning/thin_debug.cc:20:
/usr/include/c++/4.7/bits/shared_ptr_base.h:264:11: error: candidates are: template<class _Tp> class std::shared_ptr
In file included from /usr/include/boost/throw_exception.hpp:37:0,
                 from /usr/include/boost/function/detail/prologue.hpp:15,
                 from /usr/include/boost/function.hpp:24,
                 from /usr/include/boost/algorithm/string/detail/find_iterator.hpp:18,
                 from /usr/include/boost/algorithm/string/find_iterator.hpp:24,
                 from /usr/include/boost/algorithm/string/iter_find.hpp:27,
                 from /usr/include/boost/algorithm/string/split.hpp:16,
                 from thin-provisioning/thin_debug.cc:20:
/usr/include/boost/exception/exception.hpp:148:11: error:                 template<class T> class boost::shared_ptr
thin-provisioning/thin_debug.cc:46:11: error: 'shared_ptr' does not name a type
thin-provisioning/thin_debug.cc:56:45: error: '<unnamed>::formatter::ptr' has not been declared
thin-provisioning/thin_debug.cc:63:27: error: 'ptr' was not declared in this scope
thin-provisioning/thin_debug.cc:63:30: error: template argument 2 is invalid
thin-provisioning/thin_debug.cc:64:11: error: reference to 'tuple' is ambiguous
In file included from /usr/include/c++/4.7/utility:72:0,
                 from /usr/include/c++/4.7/algorithm:61,
                 from /usr/include/boost/algorithm/string/classification.hpp:14,
                 from thin-provisioning/thin_debug.cc:19:
/usr/include/c++/4.7/bits/stl_pair.h:80:11: error: candidates are: template<class ...> class std::tuple
In file included from /usr/include/boost/tuple/tuple.hpp:33:0,
                 from thin-provisioning/thin_debug.cc:22:
/usr/include/boost/tuple/detail/tuple_basic.hpp:76:7: error:                 template<class T0, class T1, class T2, class T3, class T4, class T5, class T6, class T7, class T8, class T9> class boost::tuples::tuple
thin-provisioning/thin_debug.cc:64:11: error: 'tuple' does not name a type
thin-provisioning/thin_debug.cc:66:10: error: 'field_type' was not declared in this scope
thin-provisioning/thin_debug.cc:66:20: error: template argument 1 is invalid
thin-provisioning/thin_debug.cc:66:20: error: template argument 2 is invalid
thin-provisioning/thin_debug.cc: In member function 'void {anonymous}::formatter::field(const string&, const string&)':
thin-provisioning/thin_debug.cc:53:12: error: request for member 'push_back' in '(({anonymous}::formatter*)this)->{anonymous}::formatter::fields_', which is of non-class type 'int'
thin-provisioning/thin_debug.cc:53:44: error: 'field_type' was not declared in this scope
thin-provisioning/thin_debug.cc: In member function 'void {anonymous}::formatter::child(const string&, int)':
thin-provisioning/thin_debug.cc:57:12: error: request for member 'push_back' in '(({anonymous}::formatter*)this)->{anonymous}::formatter::fields_', which is of non-class type 'int'
thin-provisioning/thin_debug.cc:57:40: error: 'field_type' was not declared in this scope
thin-provisioning/thin_debug.cc: In member function 'virtual void {anonymous}::xml_formatter::output(std::ostream&, int)':
thin-provisioning/thin_debug.cc:82:11: error: 'field_type' was not declared in this scope
thin-provisioning/thin_debug.cc:82:21: error: template argument 1 is invalid
thin-provisioning/thin_debug.cc:82:21: error: template argument 2 is invalid
thin-provisioning/thin_debug.cc:82:39: error: expected initializer before 'it'
thin-provisioning/thin_debug.cc:83:9: error: 'it' was not declared in this scope
thin-provisioning/thin_debug.cc:83:22: error: request for member 'begin' in '(({anonymous}::xml_formatter*)this)->{anonymous}::xml_formatter::<anonymous>.{anonymous}::formatter::fields_', which is of non-class type 'int'
thin-provisioning/thin_debug.cc:83:45: error: request for member 'end' in '(({anonymous}::xml_formatter*)this)->{anonymous}::xml_formatter::<anonymous>.{anonymous}::formatter::fields_', which is of non-class type 'int'
thin-provisioning/thin_debug.cc:94:6: error: 'ptr' is not a member of '{anonymous}::formatter'
thin-provisioning/thin_debug.cc:94:21: error: expected ';' before 'f'
thin-provisioning/thin_debug.cc:95:6: error: 'f' was not declared in this scope
thin-provisioning/thin_debug.cc: In member function 'virtual void {anonymous}::show_superblock::exec(const strings&, std::ostream&)':
thin-provisioning/thin_debug.cc:186:4: error: 'superblock' was not declared in this scope
thin-provisioning/thin_debug.cc:186:4: note: suggested alternative:
In file included from ./thin-provisioning/metadata.h:30:0,
                 from thin-provisioning/thin_debug.cc:32:
./thin-provisioning/superblock.h:52:10: note:   'thin_provisioning::superblock_detail::superblock'
thin-provisioning/thin_debug.cc:186:15: error: expected ';' before 'const'
thin-provisioning/thin_debug.cc:188:21: error: 'sb' was not declared in this scope
thin-provisioning/thin_debug.cc: At global scope:
thin-provisioning/thin_debug.cc:213:66: error: expected class-name before '{' token
thin-provisioning/thin_debug.cc:215:53: error: 'device_details' has not been declared
thin-provisioning/thin_debug.cc: In static member function 'static void {anonymous}::device_details_show_traits::show({anonymous}::formatter&, const string&, const int&)':
thin-provisioning/thin_debug.cc:216:36: error: request for member 'mapped_blocks_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc:217:37: error: request for member 'transaction_id_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc:218:36: error: request for member 'creation_time_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc:219:32: error: request for member 'snapshotted_time_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc: At global scope:
thin-provisioning/thin_debug.cc:230:48: error: expected class-name before '{' token
thin-provisioning/thin_debug.cc:232:53: error: 'block_time' has not been declared
thin-provisioning/thin_debug.cc: In static member function 'static void {anonymous}::block_show_traits::show({anonymous}::formatter&, const string&, const int&)':
thin-provisioning/thin_debug.cc:233:28: error: request for member 'block_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc:234:27: error: request for member 'time_' in 'value', which is of non-class type 'const int'
thin-provisioning/thin_debug.cc: In member function 'void {anonymous}::show_btree_node<ValueTraits>::show_node(persistent_data::btree_detail::node_ref<ValueTraits>, std::ostream&)':
thin-provisioning/thin_debug.cc:276:5: error: 'ptr' is not a member of '{anonymous}::formatter'
thin-provisioning/thin_debug.cc:276:20: error: expected ';' before 'f2'
thin-provisioning/thin_debug.cc:277:12: error: 'f2' was not declared in this scope
In file included from ./persistent-data/data-structures/btree.h:424:0,
                 from thin-provisioning/thin_debug.cc:31:
./persistent-data/data-structures/btree.tcc: In instantiation of 'class persistent_data::btree_detail::node_ref<{anonymous}::device_details_show_traits>':
thin-provisioning/thin_debug.cc:258:27:   required from 'void {anonymous}::show_btree_node<ValueTraits>::exec(const strings&, std::ostream&) [with ValueTraits = {anonymous}::device_details_show_traits; {anonymous}::strings = std::vector<std::basic_string<char> >; std::ostream = std::basic_ostream<char>]'
thin-provisioning/thin_debug.cc:345:1:   required from here
./persistent-data/data-structures/btree.tcc:206:1: error: no type named 'value_type' in 'class {anonymous}::device_details_show_traits'
./persistent-data/data-structures/btree.tcc:222:1: error: no type named 'value_type' in 'class {anonymous}::device_details_show_traits'
./persistent-data/data-structures/btree.tcc:232:1: error: no type named 'value_type' in 'class {anonymous}::device_details_show_traits'
./persistent-data/data-structures/btree.tcc:248:1: error: no type named 'value_type' in 'class {anonymous}::device_details_show_traits'
./persistent-data/data-structures/btree.tcc: In instantiation of 'class persistent_data::btree_detail::node_ref<{anonymous}::block_show_traits>':
thin-provisioning/thin_debug.cc:258:27:   required from 'void {anonymous}::show_btree_node<ValueTraits>::exec(const strings&, std::ostream&) [with ValueTraits = {anonymous}::block_show_traits; {anonymous}::strings = std::vector<std::basic_string<char> >; std::ostream = std::basic_ostream<char>]'
thin-provisioning/thin_debug.cc:345:1:   required from here
./persistent-data/data-structures/btree.tcc:206:1: error: no type named 'value_type' in 'class {anonymous}::block_show_traits'
./persistent-data/data-structures/btree.tcc:222:1: error: no type named 'value_type' in 'class {anonymous}::block_show_traits'
./persistent-data/data-structures/btree.tcc:232:1: error: no type named 'value_type' in 'class {anonymous}::block_show_traits'
./persistent-data/data-structures/btree.tcc:248:1: error: no type named 'value_type' in 'class {anonymous}::block_show_traits'
make: *** [thin-provisioning/thin_debug.o] Error 1

--------------080804000804080703090201--
