From: Spam <spam@tnonline.net>
Message-ID: <187171148703.20031106161241@tnonline.net>
Subject: Re[2]: [linux-lvm] Can I dd one disc of a lv
In-Reply-To: <20031106134246.A16570@wagener.nu>
References: <20031106130748.A15981@wagener.nu>
 <3FAA3C95.8010708@webhackande.se> <20031106134246.A16570@wagener.nu>
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
Date: Thu Nov  6 09:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Tobias Wagener <linux-lvm@sistina.com>


> Hi,

> OK, currently dd (or better dd_rescue) is at work. What have I to do after
> the dd?

  Nothing. The drives will be identical to LVM so you should remove
  the faulty drive and then everything should be normal. :) Do not run
  any restore/backup commands.

> vgexport the VG, and then vgimport with the new device? Or do I use
> a "vgcfgrestore" and "vgcfgbackup" also?

> Greetings Tobias


> On 06/11/03 13:20, Rickard Olsson wrote:
>> Tobias Wagener wrote:
>> 
>> > Now the question: Can I "dd" the faulty 200 GB drive to the new 200 GB
>> > drive? And if, how? Does "dd if=/dev/hde1 of=/dev/hdf1" the job, or what
>> > have I to do?
>> 
>> Heinz told me:
>> "You need to dd starting from the first physical extent (use pvdata -PP
>> on the old one and look for pe_on_disk.base) to the same offset on the
>> new disk (skip and seek dd option) and you want dd to continue after
>> read errors (noerror option)."
>> 
>> Also, I was recently told about the dd_rescue utility, but I haven't had
>> the misfortune/opportunity to try that one yet.
>> 
>>     / Rickard Olsson,IT-Konsult/
>>    / Telefon: +46 70 635 01 42/
>>   / http://www.webhackande.se/
>> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
