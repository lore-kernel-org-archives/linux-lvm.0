Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBF08u9A021141
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 00:08:56 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CeMiu-00064T-K2
	for linux-lvm@redhat.com; Wed, 15 Dec 2004 00:08:56 +0000
Date: Wed, 15 Dec 2004 00:08:56 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Cannot create a Volume Group
Message-ID: <20041215000856.GF18372@agk.surrey.redhat.com>
References: <1103067201.995.12.camel@luna.horche.gu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1103067201.995.12.camel@luna.horche.gu>
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

On Wed, Dec 15, 2004 at 12:36:55AM +0100, Fernando Ruza wrote:
> Everything seems to be create properly, however when now I'm trying to
> activate the volume group or to scan it, it says it cannot found it:
 
> sol:~# vgchange -a y vg1
>   Unable to find volume group "vg1"
> sol:~# vgscan
>  No volume groups found
 
>   lvm2           2.00.29-1

Firstly, there's a bug in pvcreate 2.00.29 (it'll sometimes fail
with an error message when it shouldn't) - upgrade to .31.

Use -vvv options to see what's going on and why it ignores things.
e.g. pvscan --partial -vvv

Alasdair
-- 
agk@redhat.com
