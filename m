From: Stephen Tweedie <sct@redhat.com>
Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
Message-ID: <20020623164611.A1993@redhat.com>
References: <003401c20c0f$23a7afb0$0300000a@STATION> <000c01c20ccf$fcac9e90$0201a8c0@fosi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000c01c20ccf$fcac9e90$0201a8c0@fosi>; from steve.wray@paradise.net.nz on Thu, Jun 06, 2002 at 08:31:30AM +1200
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
Date: Mon Jun 24 08:41:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Stephen Tweedie <sct@redhat.com>, Steve Wray <steve.wray@paradise.net.nz>

Hi,

On Thu, Jun 06, 2002 at 08:31:30AM +1200, Steve Wray <steve.wray@paradise.net.nz> wrote:

> /dev/system/home /home ext3 data=journal 1 2
> 
> Its the bomb. I have a hell of a lot of dynamic data
> in that /home so in event of a crash there was a big
> chance of corruption. Not Any More!!!!!
> 8-)

I'm not quite sure why people think that data=journal is any "safer"
than the default data=ordered mode.  In fact, data=ordered could well
be safer simply because the default mode is probably in use on more
systems, and so is better tested.  :-)

data=journal writes the data to the journal as well as the metadata,
but *both* ordered and data modes flush data to disk carefully as part
of their transaction commit.  If you create new files with the default
of data=ordered, there is still an absolute guarantee that a
transaction commit will show all the data safe on disk, and you will
never see stale data blocks show up on disk after a crash.

Only the looser "data=writeback" mode of ext3 relaxes this guarantee
and makes data writes independent of metadata writes, as they are for
most other filesystems.

Cheers,
 Stephen
