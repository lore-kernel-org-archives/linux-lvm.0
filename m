Subject: Re: [linux-lvm] EXT3 vs Reiserfs
From: Markus Schiltknecht <markus@bluegap.ch>
In-Reply-To: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
Message-Id: <1070851888.1552.14.camel@avalon>
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
Date: Mon Dec  8 09:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Yanick

On Mon, 2003-12-08 at 15:39, Yanick Quirion wrote:
> I'm just asking for your personal opinion and knowledge with them.

I'm using ReiserFS on my LVM volume, having already used the 'extend
online' function. I don't really need ACLs currently.

Concerning stability: I've once had a crash due to a power loss. Then I
must have done something wrong with LVM. Anyway, I've lost many files,
but don't think that was ReiserFS's fault.

I'm also using ReiserFS on a (relatively) heavily used webserver (2x AMD
2000+, 120GB HDD, ~100 GB Traffic / Month) and have never had problems
(there w/o LVM, pure ReiserFS partitions).


Markus
