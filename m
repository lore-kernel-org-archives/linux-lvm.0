From: lembark@wrkhors.com
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <25790000.1011646431@duke.wrkhors.com>
In-Reply-To: <20020121201314.40293.qmail@web20303.mail.yahoo.com>
References: <20020121201314.40293.qmail@web20303.mail.yahoo.com>
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
Date: Mon Jan 21 14:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Brad Langhorst <bwlang@yahoo.com> on 01/21/02 12:13:14 -0800

> 
> --- lembark@wrkhors.com wrote:
>> 
>> 
>> -- Pierrick PONS <ppons@cvf.fr> on 01/21/02 19:09:31
>> +0100
>> 
>> > I've read the extending logical volume section and
>> I can't believe this.
>> > According to the doc, it would be impossible to
>> extend a logical volume 
> 
> um - i think i just did this...
> 
> lvextend -L +10G /dev/vg1/data 
> followed by 
> resize-reiserfs
> 
> no corruption (at least not that I've noticed)
> 
> maybe i'm misunderstanding...

There has been a bit if mail on the reiser list about 
corruption from expanding in-use file systems. Frankly,
for the number of [milli?]seconds it takes to do the
expansion offline it seems easier to do it unmounted.

I'm also not sure that ext3 supports online extension
(thought the original post was about ext3), and ext2
or msdos file systems certianly don't.

You also don't know if anyone is using the volume for
a networked file system, which may screw things up 
if the caching is too aggressive.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
