From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1x8ykfvhlo.fsf@kth.se>
References: <yw1xy8sguh83.fsf@kth.se> <20040110163438.62742.qmail@web80405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: which filesystem to use on slackware
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
Date: Sat Jan 10 12:29:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Chris Conn <cmcgoat@swbell.net> writes:

> --- M�ns_Rullg�rd <mru@kth.se> wrote:
>> Francis SOUYRI <francis.souyri@wanadoo.fr> writes:
>> 
>> > Hi Chris,
>> >
>> >     I think the performances are not the main things in your case,
>> >     you need to see the "managment" capabilities of each filesystems,
>> >     If you want to learn more about the LVM probably you test the move
>> >     of a logical volume, the extend, reduce of a logical volume and...
>> >
>> > With Ext3 you can grow the filesystem offline and with a kernel patch
>> > you can grow online,  you can not shrink.
>> 
>> Ext3 can be shrunk offline.
>
> Can I use ext3 and reiserfs on the same box?

I should think so.  I haven't done it personally, but I don't have any
reason to believe that it shouldn't work.

> I've set up my second disk to use reiserfs but my main disk is ext2,
> thought about converting it to ext3 since that would be easier than
> re-installing... but I'm not sure if this is a good idea. It make
> more sense to just re-install slack on my main disk with reiserfs.

That's up to you.

-- 
M�ns Rullg�rd
mru@kth.se
