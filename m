From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xy8sguh83.fsf@kth.se>
References: <20040110000045.98531.qmail@web80403.mail.yahoo.com> <1073693715.30384.6.camel@david.internal.NorcrossGroup.com>
 <1073705576.4883.5.camel@grandmother.littlebald.com>
 <3FFFCD6F.40107@wanadoo.fr>
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
Date: Sat Jan 10 07:22:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Francis SOUYRI <francis.souyri@wanadoo.fr> writes:

> Hi Chris,
>
>     I think the performances are not the main things in your case,
>     you need to see the "managment" capabilities of each filesystems,
>     If you want to learn more about the LVM probably you test the move
>     of a logical volume, the extend, reduce of a logical volume and...
>
> With Ext3 you can grow the filesystem offline and with a kernel patch
> you can grow online,  you can not shrink.

Ext3 can be shrunk offline.

-- 
M�ns Rullg�rd
mru@kth.se
