Message-ID: <512F5A51.3000909@redhat.com>
Date: Thu, 28 Feb 2013 14:23:29 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
	<20130227181236.GG1514@agk.fab.redhat.com>
	<0926B8B0C4D4424CAE1FCE69BD50CB2F0854C76E@s02008.neopost.grp>
In-Reply-To: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C76E@s02008.neopost.grp>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] raid1 Failed to activate new LV
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
Cc: MOLLE Thomas <t.molle@neopost.com>

On 02/28/2013 10:32 AM, MOLLE Thomas wrote:
> kernel: lvcreate: sending ioctl 1261 to a partition!
> kernel: device-mapper: table: 252:8: raid: Unrecognised raid_type
> kernel: device-mapper: ioctl: error adding target to table

Hi, looking at RHEL6.3 kernel code there must be a corruption or 
incompatibility somewhere between command line and kernel and raid1 
should definitely be recognized.

Could you first try running the `lvcreate` command with `-vvvv`, please?

I see the lvm2 package is fairly recent. What about kernel? What do 
`uname -a` and `dmsetup targets` say?

-- Marian

>
> I do not understand why the type is not recognized
>
>> On Wed, Feb 27, 2013 at 05:45:02PM +0100, MOLLE Thomas wrote:
>> # device-mapper: reload ioctl on failed: Invalid argument # Failed to
>> activate new LV.
>>
>> Look in your kernel message log for a more detailed error message.
>>
>> Alasdair
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
