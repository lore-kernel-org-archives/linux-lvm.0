From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Help: LVM on top of SW RAID0+1
Message-ID: <140150000.1047758272@[192.168.200.4]>
In-Reply-To: <3E70411C.AC385DAD@silicide.dk>
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net>
 <3E70411C.AC385DAD@silicide.dk>
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
Date: Sat Mar 15 13:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jon Bendtsen <jon+lvm@silicide.dk>

> "Ian E. Morgan" wrote:
>>
>> Current config:
>>
>> md1: raid0 of hda3, hdb3
>> md2: raid0 of hdc3, hdd3
>> md3: raid1 of md1, md2
>
> hmm. I tried various combinations of raid0 and raid1 ontop
> of each other. One combination had a REALLY REALLY severe
> performance penalty.

Why would you want to use raid0 with LVM? You can combine
the mirrors into a VG and distribute the space out using
LVM in the first place. You also have the option of using
striping for performance if works out with the software mirrors.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
