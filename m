Message-ID: <3EB77EE3.6050601@gmx.at>
From: kihan <kihan@gmx.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device-mapper / LVM2
References: <3EB7784A.7030603@gmx.at> <342533128.20030506110708@tnonline.net>
In-Reply-To: <342533128.20030506110708@tnonline.net>
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
Date: Tue May  6 04:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

thanks for your answer.
your are right, this would be the last thing i want to do, after 4 days 
kernel compiling in my spare time. ;-)

i only wanna help to test some new features eacht time i compile a new 
kernel, so i thought, that i maybe wann try LVM2 and EVMS2 together, 
since they are using the (nearly) same kernel interface.

so subscribing to this list was the last thing to try, before i'm going 
the "LVM2 only way". :-))

thanks again,


manfred



Anders Widman wrote:
>>hello to all,
> 
> 
>>i'm new on the list, and have some general questions.
> 
> 
>>i would like to use LVM2 and EVMS with a 2.4.20 kernel.
>>but both are patching the same files. i resolved the conflicts, but on 
>>start, i get a failure, that the libdevmapper is not compatible with the 
>>kernel driver.
> 
> 
>>so now my question is, if there is any version of "device-mapper", which 
>>i can use for EVMS and LVM2???
>>or can i simply upgrade from LVM1 to EVMS, or should i go the way with 
>>LVM2???
> 
> 
>   Or just use LVM1/2 without EVMS. It is sufficient for most uses.
> 
> 
>>at the moment i'm using 2.4.12 with LVM1, Software-Raid 5, XFS, JFS, IPSec.
> 
> 
>>thanks for any help,
> 
> 
>>manfred
> 
> 
> 
> 
> 
> 
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
>    
> 
> 
> 
> --------
> PGP public key: https://tnonline.net/secure/pgp_key.txt
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
