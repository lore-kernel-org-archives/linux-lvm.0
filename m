Message-ID: <51C3F636.6030900@redhat.com>
Date: Fri, 21 Jun 2013 08:44:06 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
	<51BB351E.4020707@alteeve.ca>
In-Reply-To: <51BB351E.4020707@alteeve.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM high availability
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Digimer <lists@alteeve.ca>, lihuiba <magazine.lihuiba@163.com>

On 06/14/2013 05:22 PM, Digimer wrote:
> On 06/13/2013 12:16 PM, lihuiba wrote:
>> Please consider the following case:
>> there are multiple storage servers each configured as LVM on top of a
>> RAID,
>> and the servers are connected by DRBD to synchronize the RAIDs.
>>
>> The question is
>> 1) can I safely active a read-only volume on all of the servers?
>
> Depends on your file system. GFS2 and OCFS2 is fine. Most all others are
> not. In either case, you can't mount a Secondary DRBD resource no matter
> what.

Adjustement: As long as the volume (actually whole volume group!) is 
read-only everywhere, cluster-FS is not necessary, just like it was not 
shared at all.

However! In case of LVM mirror, should a leg fail, you will need R/W 
access to VG to recover. Seems this is not the case.

But once you will need any changes to the VG you will either need 
cluster-locking or *at your own risk* be the cluster lock yourself:

1. ensure there is only one node modifying the VG during following
2. rescan the VG before any operation
3. do the dirty work and
4. rescan the VG on other nodes.

(Not 100% sure about above. I hope someone will correct me if I am wrong.)

DISCLAIMER: Without cluster-locking, LVM can not ensure LV is not active 
R/W elsewhere. Still there are always users trying to use LVM in cluster 
setup without cluster-locking developing new creative ways to destroy 
their data. If you still want to do it, please, state so clearly in any 
bug reports.

>
>> 2) can I safely active a read-write volume on a randomly chosen server?
>
> You need a cluster-aware files system like GFS2 and, in the context of
> LVM, you need clustered VGs and LVs which requires clvmd to be running.

You can safely activate the LV *exclusively* on any single node 
regardless of FS. This means it can not be active elsewhere at all.
Using the FS RO elsewhere is likely to serve you corrupted data as for 
example any caches may be invalid.

If you want it active R/W while active elsewhere even in read-only mode 
you will need a cluster-aware FS like the GFS2 mentioned.

Again, remember any operation like growing LV, mirror recovery or pvmove 
needs R/W access to VG and thus require cluster-locking.

>
>> 3) how about thin pool and volumes?
>

Thin-pool may be active on single-node only. In cluster only exclusive 
activation is allowed and can not be activated elsewhere even "read-only".

It should work fine without cluster locking while read-only everywhere, 
except you can not enforce read-only on the pool. (There is a bug for that.)

Attempting to write to pool active elsewhere, may render the pool's view 
corrupted on other nodes. So when writing to pool, you should at least 
deactivate the pool and all thin volumes on all other nodes, and 
reactivate afterwards.

-- Marian
