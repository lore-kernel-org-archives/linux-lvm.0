Subject: Re: [linux-lvm] EXT3 vs Reiserfs
From: Markus Schiltknecht <markus@bluegap.ch>
In-Reply-To: <1070899120.9011.41.camel@hotbox>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
	 <1070897481.9011.38.camel@hotbox>  <1070854294.1569.23.camel@avalon>
	 <1070899120.9011.41.camel@hotbox>
Message-Id: <1070899987.1559.30.camel@avalon>
Mime-Version: 1.0
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
Date: Mon Dec  8 10:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I was running RAID5.

How is that possible? I mean, even if one drive fails completely, your
should still have all your data accessible.

I once managed to have two drives of a RAID5 failing on the exact same
blocks. However, that seemd to have to do with the IDE Bus. Because only
one drive really had bad blocks. I could easily acces the other drive
after a reboot. (And had full access to all data again).
