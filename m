From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] filesystem corruption...
Message-Id: <3399590000.1014862362@tiny>
In-Reply-To: <20020227164228.A964@lynx.adilger.int>
References: <224974437.20020227233630@tnonline.net>
    <20020227164228.A964@lynx.adilger.int>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Feb 27 20:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Anders Widman <andewid@tnonline.net>


On Wednesday, February 27, 2002 04:42:28 PM -0700 Andreas Dilger <adilger@clusterfs.com> wrote:

> On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
>> Unfortunatley, something went seriously wrong. I can't mount the disk
>> any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
>> a valid filesystem on the device. Vgscan does however find all devices
>> and can activate the volume group, but reiserfsck doesn't work.
>> 
>> What should I do to be able to save a s much data as possible?
> 
> dd if=/dev/vg/lv of=/new/disk conv=sync,noerror

Then we should be able to use debugreiserfs and reiserfsck to 
find a copy of the super in the log, or just recreate it.

-chris
