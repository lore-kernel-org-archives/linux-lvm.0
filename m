Message-ID: <51ED93A8.6040303@redhat.com>
Date: Mon, 22 Jul 2013 22:18:48 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130722051502.GA5685@gmail.com> <51ED2268.7030702@redhat.com>
	<20130722105712.GA1570@gmail.com> <20130722112348.GB1570@gmail.com>
In-Reply-To: <20130722112348.GB1570@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvcreate --thin gives "unknown segment type" error
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
To: Kumar amit mehta <gmate.amit@gmail.com>
Cc: linux-lvm@redhat.com

Dne 22.7.2013 13:23, Kumar amit mehta napsal(a):
> On Mon, Jul 22, 2013 at 06:57:42AM -0400, Kumar amit mehta wrote:
>> On Mon, Jul 22, 2013 at 02:15:36PM +0200, Zdenek Kabelac wrote:
>>> configure --with-thin=internal
>>>
>>> (and you will likely miss  '--enable-udev_sync'
>> Thank you, it worked!
>>
>> However, It seems that "discards" behavior for thin pool is not
>> supported on RHEL 6.4. Please confirm.
>> # ./configure --with-thin=internal --enable-debug
>>
>> # make; make install
>>
>> # lvcreate --discards passdown -L 1G -T thinvg1/thinlv1
>>    Logical volume "thinlv1" created
>>
>> # lvs -o +devices|grep -i thinlv1
>>    thinlv1       thinvg1       twi-a-tz-   1.00g               0.00
>> thinlv1_tdata(0)
>>
>> # dmesg
>> device-mapper: thin: Data device (dm-3) discard unsupported: Disabling
>> discard passdown.
>>

It's your backend device used for thinpool data  which doesn't support 
discard. So it fallbacks to  nopassdown behaviour (discard is processed only 
at pool level).


> I'm invoking these commands on a VM. I do not know, from where these
> storage were mapped to my VM(were done my some storage admin). However

Important piece of puzzle - if you want to see TRIM command hits your storage,
your storage needs to support it ;)

BTW it's perfectly ok to use thin pool only with nopassdown.

Zdenek


NOTE: issue_discard in lvm.conf is not related in any way with --discards 
option for thin pool creation.
