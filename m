From: Petro <petro@auctionwatch.com>
Message-ID: <20011213002345.GA13832@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Patching Kernel 2.4.16.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Dec 12 18:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

    I'm trying to build a kernel with the 1.0.1 stuff, I run the
    Makefile in the PATCHES file generating lvm-1.0.1-2.4.16.patch
    and apply this to the kernel souce (patch -p1 < ../...) cleanly.
    Run make oldconfig, make dep, make bzImage > output and I get a
    whole bunch of errors starting with: 

    In file included from lvm.c:262:
    lvm-internal.h:49: parse error before `*'
    lvm-internal.h:49: warning: type defaults to `int' in declaration of
    `vg'
    lvm-internal.h:49: warning: data definition has no type or storage
    class
    lvm-internal.h:86: parse error before `*'
    lvm-internal.h:86: warning: function declaration isn't a prototype
    lvm-internal.h:87: parse error before `*'
    lvm-internal.h:87: warning: function declaration isn't a prototype
    lvm-internal.h:88: parse error before `vg_t'
    lvm-internal.h:88: warning: function declaration isn't a prototype
    lvm-internal.h:89: parse error before `lv_t'
    lvm-internal.h:89: warning: function declaration isn't a prototype
    lvm-internal.h:90: parse error before `*'
    lvm-internal.h:90: warning: function declaration isn't a prototype
    lvm-internal.h:91: parse error before `*'
    lvm-internal.h:91: warning: function declaration isn't a prototype
    lvm-internal.h:92: parse error before `*'
    lvm-internal.h:92: warning: function declaration isn't a prototype
    lvm-internal.h:93: parse error before `*'
    lvm-internal.h:93: warning: function declaration isn't a prototype
    lvm-internal.h:94: parse error before `*'
    lvm-internal.h:94: warning: function declaration isn't a prototype
    lvm-internal.h:101: parse error before `*'
    lvm-internal.h:101: warning: function declaration isn't a prototype
    lvm-internal.h:102: parse error before `*'
    lvm-internal.h:102: warning: function declaration isn't a prototype
    lvm-internal.h:103: parse error before `*'
    lvm-internal.h:103: warning: function declaration isn't a prototype
    lvm-internal.h:104: parse error before `*'
    lvm-internal.h:104: warning: function declaration isn't a prototype
    lvm-internal.h:105: parse error before `*'
    lvm-internal.h:105: warning: function declaration isn't a prototype
    lvm-internal.h:106: parse error before `*'
    lvm-internal.h:106: warning: function declaration isn't a prototype
    lvm.c:286: parse error before `*'
    lvm.c:286: warning: function declaration isn't a prototype
    lvm.c:287: warning: `struct lv_bmap' declared inside parameter list
    lvm.c:287: warning: its scope is only this definition or
    declaration, which is p
    robably not what you want.
    lvm.c:308: parse error before `*'
    lvm.c:308: warning: function declaration isn't a prototype
    lvm.c:310: parse error before `*'
    lvm.c:310: warning: function declaration isn't a prototype
    lvm.c:311: parse error before `*'
    lvm.c:311: warning: function declaration isn't a prototype
    lvm.c:312: parse error before `lv_t'
    lvm.c:312: warning: function declaration isn't a prototype
    lvm.c:313: parse error before `lv_t'
    lvm.c:313: warning: function declaration isn't a prototype
    lvm.c:315: parse error before `*'
    lvm.c:315: warning: function declaration isn't a prototype
    lvm.c:316: parse error before `*'
    lvm.c:316: warning: function declaration isn't a prototype
    lvm.c:317: parse error before `*'
    lvm.c:317: warning: function declaration isn't a prototype

    And going on for several pages. 

    This isn't right is it?


-- 
Share and Enjoy. 
