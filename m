Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9CEDFJp017947
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 15:13:15 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GY1JD-0004TH-Pg
	for linux-lvm@redhat.com; Thu, 12 Oct 2006 15:13:15 +0100
Date: Thu, 12 Oct 2006 15:13:15 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] RE: linux-lvm Digest, Vol 32, Issue 7
Message-ID: <20061012141315.GX17654@agk.surrey.redhat.com>
References: <DD0238A0AAE9B74A8F70A91BDF497C2F0149D9D3@xmb-ams-335.emea.cisco.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DD0238A0AAE9B74A8F70A91BDF497C2F0149D9D3@xmb-ams-335.emea.cisco.com>
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

On Thu, Oct 12, 2006 at 03:42:42PM +0200, Phil Lowden (plowden) wrote:
> 1. Do the array-based copy.
> 2. Reinitialze the new PV(s).
> 3. Edit a copy of the original LVM backup configuration file with
> the UUID of the new PV(s), the new VG name, and a new VG UUID.
> 4. Restore the edited configuration file to the new PV(s).
> 5. Activate the new VG and use it.
 
There are tools to help you do that without having to edit/restore
a metadata backup file:
  filters to tell lvm2 to only use the disks in the VG you're changing 
    (easiest to use with --config now)
  --uuid options to pvchange and vgchange
  vgrename <old_vg_uuid> <new_name>

Alasdair
-- 
agk@redhat.com
