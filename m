Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJJXVr03457
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:33:31 -0500
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJJXP3d005403
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:33:25 -0500
Received: from mail (unknown [192.168.2.18])
	by conterra.de (-) with ESMTP id C9A913C8036
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 20:33:19 +0100 (CET)
Message-ID: <419E4A7F.9000802@conterra.de>
Date: Fri, 19 Nov 2004 20:33:19 +0100
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] device mapper Q
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

maybe this is more dm related than LVM2, but I could not
finger out where to find more info/help....

after I turned to LVM2, I noticed, that the VG-specific
subdirectory below /dev/<VG>/<LV> now contains symlinks
to /dev/mapper/<VG>-<LV> devices.

Those devices also appear as /dev/dm-<N> again.

Q: who creates those links? For any reason I'm missing
one of these link. Should I create it by hand?

If mounting an LV, which path should I prefer?

I used to use EXT2 labels and entered the LVs to
the /etc/fstab using LABEL=<NAME>. With LVM2/DM the
kernel now locates them as /dev/dm_<N> instead of
/dev/<VG>/<LV>. Does it matter?

Is there any more DM background information around besides
http://sources.redhat.com/dm/, or do I have to analyze
the C-code to learn more about it?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
