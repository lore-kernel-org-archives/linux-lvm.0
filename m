Message-ID: <45C9E5B0.5010703@redhat.com>
Date: Wed, 07 Feb 2007 14:44:00 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange LVM Error With AoE Disks
References: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
In-Reply-To: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Coraid Support <support@coraid.com>

Jayson Vantuyl wrote:
> Hello,
> 
> We have been using Coraid's ATA-Over-Ethernet shelves for a while with
> much success.
> 
> Recently, we added a second shelf (numbered 1) to our first shelf
> (numbered 0).  CLVM has been running on the old shelf perfectly fine.
> 
> As soon as I added the second shelf, attempting to lvcreate a new lv
> utilizing the new disks generated roughly the following errors:
> 
>   Error locking on node ey00-02: Internal lvm error, check syslog
>   Error locking on node ey00-05: Internal lvm error, check syslog
>   Error locking on node ey00-01: Internal lvm error, check syslog
>   Error locking on node ey00-00: Internal lvm error, check syslog
>   Error locking on node ey00-04: Internal lvm error, check syslog
>   Error locking on node ey00-03: Internal lvm error, check syslog
>   Failed to activate new LV.
> 
> All of the nodes show the following errors in syslog:
> 
> Feb  7 06:09:36 ey00-00 lvm[4869]: Couldn't find all physical volumes
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid
> '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid
> '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid
> '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid
> '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find all physical volumes
> for volume group ey00-data.
> Feb  7 06:09:37 ey00-00 lvm[4869]: Volume group for uuid not found:
> WWbD8SXOsAJzDYRCFQiciQho84Rl99nVF7QbO0ArRxnH4cZeKgzG0Nx4gbEhgALU
> 
> Inspecting the lvm.conf shows that these devices are the new ones that
> were added.
> 
> Even more bizarre, pvscan finds them just fine on all nodes.
> 
> The only thing I can note about these devices that is particularly
> different is that they appear to be using minor numbers above 256.  Note
> this ls output:
> 
> brw-rw---- 1 root disk 152, 288 Feb  7 04:43 /dev/etherd/e1.2
> brw-rw---- 1 root disk 152, 289 Feb  7 06:10 /dev/etherd/e1.2p1
> brw-rw---- 1 root disk 152, 304 Feb  7 04:44 /dev/etherd/e1.3
> brw-rw---- 1 root disk 152, 305 Feb  7 06:10 /dev/etherd/e1.3p1
> 
> Is there a known problem with LVM or CLVM related to large device minor
> numbers?


Did you restart clvmd after adding the new disks? There is a bug where it
doesn't always recognise new hardware.

-- 

patrick
