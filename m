Message-Id: <3C87A0A3.8080605@theiqgroup.com>
From: Kelly Corbin <kcorbin@theiqgroup.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan errors
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
    <20020305223226.A19035@sistina.com> <3C854B93.2060402@theiqgroup.com>
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
Date: Thu Mar  7 11:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

OK, now I have another problem.  I got vgscan to run fine now off of my 
boot CD, but now the system fails the vgscan on boot (/ is an LVM) with 
an 'ERROR 28 writing volume group backup file /etc/...'

I'm assuming this is because the initrd created by lvmcreate_initrd is 
not big enough to accomodate the metadata backup.  What size is this 
generally (lvmcreate_initrd says it calculates this automatically) and 
to what size should I set this manually to get this to work?  How much 
space do I need for the backups during vgscan?

Thanks.

Kelly Corbin wrote:

> Doh! I didn't get what you were saying in your first reply.  I'm sure 
> that's it.  It's running in an init. ramdisk image and there's very 
> little actual space.  Generally speaking, how big do those backups get?
> 
> Thanks for your help.
> 
> Heinz J . Mauelshagen wrote:
> 
>> On Tue, Mar 05, 2002 at 02:20:44PM -0600, Kelly Corbin wrote:
>>
>> It is probably too little free space in the root fs.
>> Because you've got somany extents the size of the metadata backup is 
>> bigger
>> as well.
>>
>> Check your root fs free space, please.
>>
>>
>>> Thanks.
>>>
>>>
>>> Heinz J . Mauelshagen wrote:
>>>
>>>
>>>> Error 2 is ENOENT (no entry).
>>>> Could be a space problem in case / run full.
>>>>
>>>> Regards,
>>>> Heinz    -- The LVM Guy --
>>>
> 
> 


-- 
--------------------------------------------
-- Kelly Corbin
-- Systems Administrator
--
-- http://www.theiqgroup.com
-- The Future of eServices...
--
-- The IQ Group, Inc.
-- 6740 Antioch Suite 110
-- Merriam, KS 66204
-- (913)-722-6700 x105
-- Fax (913)722-7264
--------------------------------------------
