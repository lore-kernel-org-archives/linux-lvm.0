content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: re[3]: [linux-lvm] resize LV
Message-ID: <55939F05720D954E9602518B77F6127FA23570@FTWMLVEM01.e2k.ad.ge.com>
From: "Ma, Thanh(IndSys, GE Interlogix)" <Thanh.Ma@ge.com>
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
Date: Tue Jan 28 16:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

RedHat 8.0 manuals says the filesystem needs to be unmounted to resize a =
LM.
I installed 'lvmgui' (search on freshmeat) and it extends a ext3 LM =
without unmounting it (at least I found no references to 'umount' in the =
its Java souce code.

Thanh

-----Original Message-----
From: Greg Freemyer [mailto:freemyer@NorcrossGroup.com]
Sent: Tuesday, January 28, 2003 5:25 PM
To: LVM Mailing list; LVM Mailing list
Subject: re[3]: [linux-lvm] resize LV

 >>  awesome links, thanks.

 >>  any word on if the 2.6 kernel will also add support for resizing =
ext3
 >>  mounted filesystems? all it talks about on the site is ext2. but =
ext3 is
 >>  just ext2 with a journal, right? so it should work for ext3 as =
well,
 >>  right?

 >>  alex

I'm not 100% sure, but I believe the 2.4.x patches support both and the =
2.5.x kernel status page says "ext2/ext3 online resize support".

Greg Freemyer


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
