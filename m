Return-Path: <bcorsello@usa.net>
Message-ID: <20001219024304.18466.qmail@nwcst312.netaddress.usa.net>
Date: 18 Dec 00 21:43:04 EST
From: Brad Corsello <bcorsello@usa.net>
Subject: [linux-lvm] (no subject)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

vgextend segfaults (lvm 0.9, kernel test10) 
X-Mailer: USANET web-mailer (34FM.0700.4B.01)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable



>> I take it from your comment that the current CVS code is not the 0.9 c=
ode. =

Is
>> that correct?

>Correct.  The main branch will be the cluster LVM development, you
>really don't want this at the moment.

OK, lemme get this straight.  (Sorry if I'm being dense here.)  I started=
 with
the lvm kernel module code that comes with the 2.4.0-test10 sources.  I
patched it with the two 0_9 patches per the INSTALL instructions, and com=
piled
it into my kernel.  Then I installed the 0.9 tools RPM from sistina.com. =
 That
is what is segfaulting when I try to do a vgextend.  Not a fatal problem,=

since I don't absolutely need the extra space in my volume group.  But do=
es
anyone know of a patch to fix this?  Is this likely to be fixed in the fi=
nal
2.4?  =


____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1
