Date: Thu, 11 Oct 2018 09:25:50 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181011142550.GA15437@redhat.com>
References: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
Subject: Re: [linux-lvm] what is the IOPS behavior when partitions of single
 disk(raid5 backend) are used in an LVM?
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
Content-Type: text/plain; charset="utf-8"
To: Sherpa Sherpa <norbuurgen@gmail.com>
Cc: linux-lvm@redhat.com

On Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:
> I have LVM(backed by hardware RAID5) with logical volume and a volume group
> named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2 sdb3 created from
> same sdb disk.

> sdb                                8:16   0  19.7T  0 disk
> ├─sdb1                             8:17   0   7.7T  0 part
> │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0 lvm  /var/db/st01
> ├─sdb2                             8:18   0   1.7T  0 part
> │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0 lvm  /var/db/st01
> └─sdb3                             8:19   0  10.3T  0 part
>   └─archive--archivedbstore--lv (dm-0)     252:0    0  10.3T  0 lvm

> I am assuming this is due to disk seek problem as the same disk partitions
> are used for same LVM or may be its due to saturation of the disks

You shouldn't add different partitions as different PVs.  If it's too late
to fix, it might help to create new LV that uses only one of the
partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then copy your
current LV to the new one.
