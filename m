From: Anders Widman <andewid@tnonline.net>
Message-Id: <1692292625.20020228100703@tnonline.net>
Subject: Re: [linux-lvm] filesystem corruption...
In-Reply-To: <20020228100118.A25011@sistina.com>
References: <224974437.20020227233630@tnonline.net>
    <20020227164228.A964@lynx.adilger.int> <3399590000.1014862362@tiny>
    <77527890.20020228065139@tnonline.net>
    <45423062.20020228093553@tnonline.net> <20020228100118.A25011@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Feb 28 03:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Heinz J . Mauelshagen" <linux-lvm@sistina.com>

> On Thu, Feb 28, 2002 at 09:35:53AM +0100, Anders Widman wrote:
>> 
>> >> On Wednesday, February 27, 2002 04:42:28 PM -0700 Andreas Dilger <adilger@clusterfs.com> wrote:
>> 
>> >>> On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
>> >>>> Unfortunatley, something went seriously wrong. I can't mount the disk
>> >>>> any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
>> >>>> a valid filesystem on the device. Vgscan does however find all devices
>> >>>> and can activate the volume group, but reiserfsck doesn't work.
>> >>>> 
>> >>>> What should I do to be able to save a s much data as possible?
>> >>> 
>> >>> dd if=/dev/vg/lv of=/new/disk conv=sync,noerror
>> 
>> >> Then we should be able to use debugreiserfs and reiserfsck to 
>> >> find a copy of the super in the log, or just recreate it.
>> 
>> >> -chris
>> 
>> > So. How much space would this require on the 'new' disk? The same
>> > amount as the entire LV? If that is, it would be impossible (for me,
>> > economically) to do this.
>> 
>> > The disk with bad blocks is 80GB, and I have a "spare" 80GB disk, but
>> > not more.
>> 
>> > //Anders
>> 
>> Oh, I forgot to ask how I can recover the filsystem
>> header/suprtblock.. What exactly is "dd if=/dev/vg/lv of=/new/disk
>> conv=sync,noerror" doing to the data, except copying it to the new
>> device?

> It copies all it can read to another sane device so that youe don't loose
> more data if your drive turns worse.

> After that, you want to use "reiserfsck --rebuild-sb /dev/vg/lv".

Ok. Unfortunatley, I can't get enough storage to copy all data. Would
it be possible to just copy the data from the broken disk to a new,
identical disk (I have a "spare" disk of the same model), and then
rebuild the filsystem?

Thanks for your time!

Regards,
Anders
