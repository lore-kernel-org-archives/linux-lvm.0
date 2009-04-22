Message-ID: <49EEE6A1.8000608@redhat.com>
Date: Wed, 22 Apr 2009 11:42:57 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About "lvmsar" and "lvmsadc"
References: <4350E8F0-2ED7-4883-8A7A-023827CDC9C5@gmail.com>
	<49EEB6D1.2040609@redhat.com>
In-Reply-To: <49EEB6D1.2040609@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, dauthieux.sylvain@gmail.com

Hi Sylvain,
I appologise for giving you false hope. I tried to run ``lvmsar 
--help'', which unfortunately works fine, so I uncorrectly _assumed_ 
lvmsar works. Mea culpa.

You'll have to resort to LVM1, or use different means on comparing FS 
content.

Best Regards,
-- Marian

Marian Csontos wrote:
> Hi Sylvian,
> IMO it looks like system settings problem:
> - fedora10 has everything on place.
> - Even debian etch package has the file 
> (http://packages.debian.org/etch/i386/lvm2/filelist).
>
> Is your PATH set correctly - should include sth like /sbin and /usr/sbin?
> You should probably run this with sudo or as root too.
>
> -- Marian
>
> Sylvain Dauthieux wrote:
>> Hello,
>>
>>
>>
>> I'm a student in Master in French and i'm working on lvm2 (OS : Linux 
>> Debian etch)
>>
>> I need to use "lvmsar" and "lvmsadc" to collect informations about 
>> data in snapshots. I would like to compare 2 snapshots (modified block).
>>
>> My problem is : "lvmsar" and "lvmsadc" are not implemented.
>>
>> I have :
>>
>> testbox3:/lib/lvm-200# dpkg -l | grep lvm
>> ii  lvm-common     1.5.20         The Logical Volume Manager for 
>> Linux (common
>> ii  lvm2           2.02.06-4etch1 The Linux Logical Volume Manager
>>
>>
>> I tested the last version of LVM but not implemented too.
>>
>> I am in training course of end studies, i'm blocked in my project.
>>
>> Could you help me please ?
>>
>>
>> In advance, thanks.
>>
>> Cordially,
>> Sylvain Dauthieux
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
