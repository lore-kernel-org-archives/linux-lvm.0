Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j4JE3JMO006231
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 15:03:19 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DYlcN-0008I0-GT
	for linux-lvm@redhat.com; Thu, 19 May 2005 15:03:19 +0100
Date: Thu, 19 May 2005 15:03:19 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] same LV UUID after vgmerge
Message-ID: <20050519140319.GT15809@agk.surrey.redhat.com>
References: <BFCF159FFD14F444B205968F32DBD5BB01700405@MAILEX01.rasgroup.ita.localnet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BFCF159FFD14F444B205968F32DBD5BB01700405@MAILEX01.rasgroup.ita.localnet>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 19, 2005 at 11:58:09AM +0200, Magni Fabrizio wrote:
> Now the strange part: all the logical volumes have duplicated LV UUID.
 
What version of lvm?   (Run 'lvm version')

Looks like a bug: the vgmerge code checks for duplicate LV names 
but not duplicate UUIDs.

Is this still lvm1 metadata? (You didn't run 'vgconvert')

> Any idea how to solve this issue?

You're going to have to edit the UUIDs by hand:
  vgchange -an oradata1_a
  vgcfgbackup oradata1_a
Edit the UUIDs in /etc/lvm/backup/oradata1_a uuid making them all
different:

                lvol1 {
                        id = "000000-0000-0000-0000-0000-0000-000001"
becomes
                lvol1 {
                        id = "000000-0000-0000-0000-0000-0000-000002"
etc.

Then:
  vgcfgrestore oradata1_a
 
Alasdair
-- 
agk@redhat.com
