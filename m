Message-ID: <4002F072.90808@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which filesystem to use on slackware
References: <20040110000045.98531.qmail@web80403.mail.yahoo.com> <1073693715.30384.6.camel@david.internal.NorcrossGroup.com> <1073705576.4883.5.camel@grandmother.littlebald.com> <3FFFCD6F.40107@wanadoo.fr> <20040112115400.GA29090@deepthought.hausboot.org>
In-Reply-To: <20040112115400.GA29090@deepthought.hausboot.org>
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
Date: Mon Jan 12 14:08:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Jens,

Jens Hoffrichter wrote:

>On Sat, Jan 10, 2004 at 11:01:19AM +0100, Francis SOUYRI wrote:
>
>  
>
>>With Ext3 you can grow the filesystem offline and with a kernel patch 
>>you can grow online,  you can not shrink.
>>    
>>
>This is not true. Using resize2fs you can grow and shrink the filesystem,
>but only offline. I'm not sure about the kernel-patch, but I'm certainly
>sure you can shrink at least offline. And using e2fsadm in conjunction
>  
>
Excuse me  yes it is possible to shrink offline an ext2 filesystem.

For the online grow kernel patch there are informations at:

http://ext2resize.sourceforge.net/
or
http://sourceforge.net/projects/ext2resize/ 

For the merge of the patch in the 2.6 kernel there are informations at:

http://www.kernelnewbies.org/status/latest.html
or
http://kerneltrap.org/node/view/716

but I can not find the patch.

>with lvm is even more comfortable ;)) Although it had some issues with
>ext3, as sometimes a filesystem is reported unchecked even if you have run
>an e2fsck -f just right before. But adding a -f to resize2fs has always
>worked for me without any trouble at all.
>
>I chose ext3 2 1/2 years ago, when doing kernel development for my diploma
>thesis, and an occassional ooops or other crash happened almost regularily.
>And waiting for the filesystem check annoyed me after the 3rd time ;)
>
>The argument for ext3 at this moment was, that you can easily convert an
>ext2 filesystem to an ext3 filesystem using tune2fs -j (to add the journal),
>and even mount the ext3 filesystem as ext2, making it available even if
>you have no support for ext3 in your kernel (2 1/2 years ago quite important!)
>
>Ext3 has never failed me in this time, I had no failure of filesystem and
>the performance was also good, at least for my needs :)
>
>CU all,
>Jens
>  
>
Best regards.

Francis
