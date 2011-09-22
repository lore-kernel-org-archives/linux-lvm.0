Message-ID: <4E7B077F.7030307@redhat.com>
Date: Thu, 22 Sep 2011 12:01:35 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-2-git-send-email-lczerner@redhat.com>
	<20110921185901.GB6760@yahoo.fr>
	<alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
In-Reply-To: <alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 01/35] fsadm: Add "create" command
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
Content-Type: text/plain; charset="us-ascii"
To: Lukas Czerner <lczerner@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 22.9.2011 11:28, Lukas Czerner napsal(a):
> On Wed, 21 Sep 2011, Stephane Chazelas wrote:
> 
>> 2011-09-21 18:45:20 +0200, Lukas Czerner:
>>> Create command provides the functionality of creating a new logical
>>> volumes including defined file system.
>>>
>>> This commit also changes the way how are commands recognised an
>>> executed. The new approach is more suitable for bigger number of
>>> commands.
>>
>> There are so many shell scripting bad practices in there that I
>> thought I had to reply.
> 
> Great, that's what I need, Thanks!
> 
>>
 So above:
>>
>> TOOL=$(basename -- "$0")
>>
>>>  
>>>  _SAVEPATH=$PATH
>>
>> Why would you need to save $PATH?
> 
> Yeah, that is something I would like to know as well :) I have actually
> removed this in patch 24 since it does not make sense to change PATH in
> this script.

When we are at this one - this commit definitely does not belong into the
fsadm update patch set - such patch should be submitted as a separate
unrelated patch and not 'well' hidden in the middle - and there are more such
things which should probably go separately - especially if they present some
bugfixes and should be merged before this large fsadm gets slowly upstream.

Zdenek
