Message-ID: <5369FFAB.2040701@redhat.com>
Date: Wed, 07 May 2014 11:40:59 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>
In-Reply-To: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Add a disk from remote node to LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/07/2014 09:33 AM, Mahmood Naderan wrote:
> 
> Hello,
> Is it possible to add a network drive to an existing LVM? I have created a group on the main node (N1) and have added three local drives. Now I want to add a remote disk from another node (N2). In other words, I want to add N2:/dev/sdb to N1:/dev/tigerfiler/tigervolume
> 
> 
> Is that possible? How? All examples I see are trying to add extra local drives and not remote drives.
> 

How do you mean "remote drive" exactly? What type is it - is it iscsi, nbd...?
Or is it just a standard local drive attached to machine N2 you need to access on machine N1?
Is the drive shared? Or you have exclusive access to that drive for single machine?

In case the drive is shared amongst several nodes, you need to consider using clustered LVM (clvmd).

But essentially, you need to connect the remote drive first and then do a pvcreate and vgextend.

-- 
Peter
