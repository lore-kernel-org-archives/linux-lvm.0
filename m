Message-ID: <4BACE0FB.5010703@davidcoulson.net>
Date: Fri, 26 Mar 2010 12:29:47 -0400
From: David Coulson <david@davidcoulson.net>
MIME-Version: 1.0
References: <4BACC1D0.9090402@davidcoulson.net>
	<20100326161851.GB15016@redhat.com>
In-Reply-To: <20100326161851.GB15016@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Auto PV scan w/ LVM
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 3/26/2010 12:18 PM, Mike Snitzer wrote:
> I'm not crystal clear on your use-case (e.g. the mechanics and
> constraints of when the clone is presented to the backup, etc).
>    

The process is basically this:

* Clone in 'sync' state so it is replicating block changes from the 
source. The clone LUN is still visible to the backup server, however 
both paths are 'failed' to multipathd
* We fracture/break the clone which makes the clone LUN available to the 
backup server for IO
* We mount LVs from the clone LUN on the backup server, run our backup 
job, unmount it
* vgexport the clone LUN VG and remove it from our multipath list with 
'multipath -f'
* Tell the SAN to start syncing the clone to source again until we need 
to break it for another backup.

I basically need to find a nice way to make LVM ignore the clone disk on 
the backup system until I am ready to make use of it for a backup. 
multipathd sees it as failed during this time, but vgscan/pvscan, etc 
all hang. Maybe that is normal.

> But the 'vgimportclone' command will enable you to make the cloned LUNs
> distinct from the originals.  Does this help you?
>    
The clone gets mounted on a different box to the source, so it's not 
important to me. I don't have a vgimportclone command on RHEL4, unless I 
need to install some additional packages.

David
