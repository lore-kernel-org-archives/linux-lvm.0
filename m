Message-ID: <3E424EDF.CC7A4F56@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot resizing bug (LVM1)
References: <A00B669E-3934-11D7-A9B9-0003937830E4@mac.com> <20030206112752.B22450@sistina.com>
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
Date: Thu Feb  6 06:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:
> 
> Dale,
> 
> thanks for finding this bug.

yeah, thanks from me too, i plan to TEST it.


> Obviously people don't resize populated snapshots very often or we'ld
> seen this one much earlier ;)

thats not true. I tried to resize polulated snapshots quite often, like
several times a day, but i gave up on that because it didnt work. Being
production machines they need to be stable.
So, why didnt i report the bug well... i didnt feel i had the time to
play arround with our production machines, and i have nowhere to test
it, so i just stopped doing snapshots. But i did email this mailing list
and described the usage and the errors i got. Not a patch no, but i feel
it was reported arround the end of october where i ran into it. Possibly
someone else did it before me.
See these links for more info:
http://lists.sistina.com/pipermail/linux-lvm/2002-October/012602.html

Okay, maybe i wasnt clear on reporting that problems continued after
downgrading, sorry about that.
http://lists.sistina.com/pipermail/linux-lvm/2002-October/012631.html


Not trying to sound negative and all it's great that this bug is gone,
but i feel that the effects of this bug was seen before. Maybe what is
needed is a better way to see what is bugs and what is
missconfiguration.




JonB
