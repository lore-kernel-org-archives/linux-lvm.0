content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Sep 2001 11:06:52 -0500
Message-ID: <550C100A8350CE4BBD3DD2D7788FD0CA481FBD@fcmail1.FC.COM>
From: "Brian Bailey" <bbailey@fcmail.org>
Subject: [linux-lvm] Unresolved symbols in lvm-mod.o
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

We're making progress in our LVM setup (Redhat 7.1, kernel 2.4.3-6, lvm
1.0) and finally have a lvm-mod.o file in /md, however, when we run
depmon -a we receive the "unresolved symbols in /md/lvm-mod-o" error.

As far as we can tell, everything else in the various steps ran well.
Suggestion?

Thanks in advance!

Brian Bailey
Fellowship Church Technology
www.fellowshipchurch.com=20
bbailey@fcmail.org
972.471.6612
