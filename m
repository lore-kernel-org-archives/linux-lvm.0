Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAGGGevn021061
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 11:16:40 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.171])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAGGGYGk006978
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 11:16:35 -0500
Received: by ug-out-1314.google.com with SMTP id m3so480596uge
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 08:16:33 -0800 (PST)
Message-ID: <170fa0d20611160816o5ba38734h458141e727b309e5@mail.gmail.com>
Date: Thu, 16 Nov 2006 11:16:03 -0500
From: "Mike Snitzer" <snitzer@gmail.com>
Subject: Re: [linux-lvm] Changing the UUID of a VG and a LV
In-Reply-To: <C43D74B62BA19A45ADD74C1AB7AEE54202B7B184@nt-gws2.gws-muenster.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <C43D74B62BA19A45ADD74C1AB7AEE54202B7B184@nt-gws2.gws-muenster.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/16/06, Steverding, Kai <Kai.Steverding@gws.ms> wrote:
> Hi !
> I have the following problem :
>
> For backup purposes, i take SAN-Snapshot Copies of my Linux machine. I
> deploy my new machines from those copies, too. This has the effect, that a
> clone of a machine has the exact same disk the original has including PV
> UUID, VG name, VG UUID, LV name and lv uuid. I found out that i can change
> the PV UUID with pvchange -u and the VG name with vgrename , but is there a
> way to change the UUID's of the VG and the LV's ? I need it, because i mount
> all those snapshots on a backup-server and this doesn't work because of the
> same UUIDs.

Look for "Hardware snapshots and LVM2?" and "Altering a Physical
Volume's UUID" in the list archives.
