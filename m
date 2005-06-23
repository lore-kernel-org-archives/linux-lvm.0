Received: from sboyd.brisbane.redhat.com
	(IDENT:U2FsdGVkX1/g4/IWmEYTMc16LlfpaWXFp0qPd1jSNBo@sboyd.brisbane.redhat.com
	[172.16.44.120])
	by pobox.brisbane.redhat.com (8.12.8/8.12.8) with ESMTP id
	j5NMnhmG028810
	for <linux-lvm@redhat.com>; Fri, 24 Jun 2005 08:49:43 +1000
Subject: Re: [linux-lvm] how to change uuid of a PV?
From: Sean Boyd <sboyd@redhat.com>
In-Reply-To: <003801c577fa$c27abc40$e81ef88f@winxp>
References: <003801c577fa$c27abc40$e81ef88f@winxp>
Date: Fri, 24 Jun 2005 08:49:43 +1000
Message-Id: <1119566983.4305.66.camel@sboyd.brisbane.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sboyd@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2005-06-23 at 22:52 +0900, HYUN-CHUL KIM wrote:
> How to change a PV uuid in LVM?
>  
> One among three hard disks constituting a LVM logical volume has
> failed.
> When trying boot without the broken hard disk, following error message
> come out.
> Couldn't find uuid with 'c3r7Sx-aTpd-JHFp-iT3c-FOiK-g7JC-uj10VK'
>  
> And I found another PV uuid '7I7F4S-pzze-dgjr-0HKP-ccX4-qG1d-SOu2ki'
> from a new hard disk.
>  
> I think the PV uuid is recorded in somewhere of LVM config so that we
> typed pvdisplay, it comes out.
> Now, I think if I can change the PV uuid from 'c3r7Sx-...' into
> '7I7F4S-...' in LVM, I can manage to boot and to recover data from the
> two still-healthy hard disks.
>  
> How can I change the PV uuid information recorded in the LVM? or Where
> are the PV uuids recorded?

The man pages explain what needs to be done.

You need to make sure you have a backup file of your VG config prior to
the disk failure. eg: /etc/lvm/backup/volGroup00

"vgdisplay --partial --verbose" to show the UUID's of PV's that are no
longer preset

"pvcreate --restorefile filename --uuid uuid <device>" to restore the
PV.

filename = /etc/lvm/backup/volGroup00
uuid = the uuid of the PV that failed

"vgcfgrestore --file filename <volGroupName>" to restore the VG metadata

--Sean
