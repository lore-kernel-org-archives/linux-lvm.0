Message-ID: <536A2E5C.4000004@redhat.com>
Date: Wed, 07 May 2014 15:00:12 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>	<5369FFAB.2040701@redhat.com>
	<1399457072.41382.YahooMailNeo@web141606.mail.bf1.yahoo.com>
In-Reply-To: <1399457072.41382.YahooMailNeo@web141606.mail.bf1.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mahmood Naderan <nt_mahmood@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 05/07/2014 12:04 PM, Mahmood Naderan wrote:
>
>
>
>> How do you mean "remote drive" exactly? What type is it - is it iscsi, nbd...?
>
> There are two nodes in a single rack. Each has 4 slots for SATAII disks. Current configuration is
>
>
> N1: /dev/sda, /dev/sdb, /dev/sdc, /dev/sdd where the last three (b, c, d) are grouped in in a single LVM volume.
>
>
> N2: /dev/sda, /dev/sdb where the last one (b) is free and I want to add it to the LVM of N1.
>
> Each node is running an independent operating system (scientific linux)Currently /dev/sdb on N2 is not shared.
 > I have just format it as ext4 (which is the same format as the LVM of 
N1).

In any case keep in mind node N2 would need to be up and running all the 
time or you risk rendering N1 inoperable while N2 has outage or is 
broken - depending on which data would be stored at N2.

I suggest either:

- using RAID[156] to make the remote drive (temporary) dispensable.

- making the PV non-allocatable by default and enable it only when 
allocating LVs manually for data you do not need all the time - for 
example you do not want your root filesystem corrupted while unavailable 
but that may be acceptable for backup copies (but NFS may be sufficient 
solution for that.)

Another option would be to use distributed filesystem like Gluster which 
was designed to keep data spread over bunch of nodes while ensuring 
redundancy but I understand it was designed to work with larger number 
of nodes and I am not sure how efficient that would be on 2 nodes as you 
are describing.

-- Martian


>
>
>
>> But essentially, you need to connect the remote drive first and then do a pvcreate and vgextend.
>
> Should I run these commands on N1 or N2?
>
> Regards,
> Mahmood
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
