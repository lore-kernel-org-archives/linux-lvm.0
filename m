Subject: Re: [linux-lvm] Re: xfs_growfs, lvm, and sparcs....
Mime-Version: 1.0 (Apple Message framework v548)
From: Tod Detre <tod@po.cwru.edu>
Content-Transfer-Encoding: 7bit
In-Reply-To: <0DD2B431-0B81-11D7-A700-000393B2C740@tod.net>
Message-Id: <1691FE4C-0B83-11D7-A700-000393B2C740@po.cwru.edu>
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
Date: Mon Dec  9 08:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

sorry for spamming the lvm list I ment to sent this to the xfs list.

in case you guys are interested and/or know how to solve my problem,
I'm trying to use lvm/xfs on an Ultrasparc 5 and running into problems
with the xfs_growfs program. It seems to not be able to read the size
of the disk when growing. As you can see below it apears to be a 32 bit
vs 64 bit issue. can anyone confirm this or tell me a way around it?

On Monday, December 9, 2002, at 09:18 AM, Tod Detre wrote:

> oops, sorry, you're right it's an Ultrasparc 5 with  64bit kernel.
>
> Is there a way around this issue with the 64/32 bit difference?
>
> On Saturday, December 7, 2002, at 04:54 PM, Christoph Hellwig wrote:
>
>> On Fri, Dec 06, 2002 at 09:35:16AM -0500, Tod Detre wrote:
>>> xfs kernel from cvs 2.4.20-xfs
>>> xfsprogs from cvs (same as kernel)
>>> Sparcstation 5, ide disks
>>
>> how did you get ide disks connected to a SS5?  Sounds more like a 
>> Ultra5
>> to me.  If it's really an Ultra5 and you use a sparc64 kernel with a
>> 32bit userland the error is expected.
>>
> --
> Tod Detre
> Unix Technical Support
> Case Western Reserve University
> usworkstation@po.cwru.edu
> 216-368-3060
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
--
Tod Detre
Unix Technical Support
Case Western Reserve University
usworkstation@po.cwru.edu
216-368-3060
