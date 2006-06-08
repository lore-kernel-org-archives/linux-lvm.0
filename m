Message-ID: <44882ED2.4050806@alienworld.org>
Date: Thu, 08 Jun 2006 16:06:10 +0200
From: Alen Salamun <alien@alienworld.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Right way to resize LVM Volume on SAN?
References: <4487E578.2060202@alienworld.org> 
	<20060608094246.GA2775@redhat.com>
In-Reply-To: <20060608094246.GA2775@redhat.com>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Thank you. I read that already. And since it only says:

"Expand the PV on /dev/sda1 AFTER enlarging the partition with fdisk"

my question is related on part of enlarging partition with fdisk. Do I 
have to do it in described way (delete, create new with extended last 
sector) to preserve data or is there any other "less destructive 
look-a-like" way?

Best regards

Heinz Mauelshagen wrote:
> On Thu, Jun 08, 2006 at 10:53:12AM +0200, Alen Salamun wrote:
>> Hello All!
>>
>> I have read all the archives, HOWTO etc. but I don't seem to find the 
>> definitive guide to do it correctly.
>>
>> My diskspace in Linux is on SAN. The last partition (/dev/sda3) is LVM, 
>> ext3 and it represents my /home. Now I expanded the SAN volume and I 
>> would like to add this additional space to this last LVM partition.
>>
>> I already see larger disk space with fdisk. AFAIK I have now two 
>> options. Either I create new partition (for example /dev/sda4) and 
>> pvcreate it and add it to Logical Volume or I can resize existing 
>> /dev/sda3 since it is the last partition and I can resize it to new end 
>> sector.
>>
>> I would prefer resizing existing partition. So I should make backup, 
>> delete existing partition /dev/sda3. make new partition with new end 
>> sector and same start sector and do pvresize, lvresize on it right?
>>
>> Is there any other way to do it? It is after all quite something to 
>> delete existing live partiton and hope it still work after resize :)
> 
> man pvresize
> 
>> Thank you!
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
