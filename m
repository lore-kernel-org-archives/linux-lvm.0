Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6C5xJwc000775
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 01:59:19 -0400
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6C5x9d3018338
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 01:59:09 -0400
From: Daniel Stodden <daniel.stodden@citrix.com>
Date: Fri, 11 Jul 2008 22:57:31 -0700
Message-Id: <1215842251.3751.53.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgchange -a memory consumption
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux LVM <linux-lvm@redhat.com>


Hi.

I'm running, lvm2-2.02.26.

Found that =EF=BB=BFvgchange -a y/n generates remarkable memory consumption=
 on
volumes with larger numbers of small volumes.

Tried on a VG with 1024 LVs of 8MB each. Interestingly, the type of
operation does not seem to matter much. Notably, deactivating an already
unavailable volume group generates similarly high pressure than actually
activating it.

Looking at the code, I've got only gained a partial understanding where
the memory is exactly spent -- and for what. So much I believe I do
understand, maybe someone can enlighten me:

Iterating through all the volumes pushes the data segment up by about
750k -- per iteration. That memory allocated per volume never seems to
get freed.

So, together with the memory locking performed in lock_vol, it's only a
matter of installed RAM and volume numbers when the OOM killer will kick
in.

_vg_read() seems to play a role. Apparently replayed twice for each LV
(once for lock, then for unlock).=20

To a rather outside observer like me, the path taken to get there seems
rather strange. The LV is handed over as a UUID string to lock_vol().
In the '-an' case, this is handed over to lv_deactivate, which will
(re-)load both the VG and LV metadata in order to get the respective
lvinfo struct.=20

So what I don't really get is:=20

Why is that data reread? Especially the VG metadata. Or am I missing
something. Second: why isn't that memory freed after returning from
activate_lv?

But most importantly: Could this be fixed?

Best,
Daniel
