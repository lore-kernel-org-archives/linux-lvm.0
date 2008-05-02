Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42Ed3oQ027410
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:39:03 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42EcpUf016565
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:38:52 -0400
Date: Fri, 2 May 2008 10:38:44 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <1311113506.20080502101444@marki-online.net>
Message-ID: <Pine.LNX.4.44.0805021022270.30479-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2 May 2008, Marek Podmaka wrote:

> I don't think that automatically making changes to the VG is a good
> idea. Imagine that you have a snapshot on disk mapped from SAN storage
> array and that becomes temporary unavailable (SAN switch failure or
> whatever). It would be a bad idea to remove this PV from VG just
> because it is TEMPORARY unavailable. And how do you distinguish
> between ram disk and normal disk and if it is totally gone or it is
> only temp issue? Also if real HDD fails, you don't want to vgreduce
> it, you want to replace it, vgcfgrestore it and sync it (in case you
> are using mirroring). Also imagine that you can have also real data on
> the same PV, not only snapshot.

When activating a VG, missing PVs should be marked "missing", and show as 
such with pvs.  Missing PVs should behave exactly as if they were
not missing, but have I/O errors on every operation.  Every attempted
I/O on a missing PV should cause a synthetic "missing PV" error.  This
should make mirrors, etc, do the right thing.  LVs partially on the
missing PV could be mountable, getting errors for spots on the missing PV.

The could be an option on vgchange for --ignoremissingpv to activate
with missing PVs.  You might not want to activate with a root filesystem
partially on a missing PV (filesystem corruption).  

It could be helpful if LVs partially on missing PVs were made read-only.  If
the PV was missing only temporarily, this prevents filesystem corruption.  On
the other hand, if the PV is really gone, you want to be able to read it
to recover as much data as you can.  This determination is straightforward
for regular and snapshot LVs (snapshots should be read-only if they or their
origin is partially missing).  It would be more complicated for mirrored LVs.

Finally, there is the issue of metadata changes made while some PVs are
missing.  Suppose there are 2 PVs, one is temporarily missing, and you
make changes to LVM (add/remove LVs and snapshots).  When you reboot and
the missing PV comes back, which version of metadata do you use?
"Most recent version" has some failure scenarios.  AIX solves this
problem with "quorum".  A quorum of PVs must have the same metadata 
version for the VG to be automatically activated.  Otherwise, an admin must
pick which version to use.  A quorum is a simple majority by default.

In any case, it should be obvious that supporting activation of VGs with
missing PVs is not trivial, and using a ram disk for a PV is insane until
missing PVs are fully supported.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
