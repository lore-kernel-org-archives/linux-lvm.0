Subject: Re: [linux-lvm] XFS crash on lvm
From: Christophe Zwecker <czwecker@sysctl.de>
In-Reply-To: <Pine.LNX.4.21.0204041116060.719-100000@miami.datech2.er.heitec.net>
References: <Pine.LNX.4.21.0204041116060.719-100000@miami.datech2.er.heitec.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1017916499.5373.10.camel@fry.sysctl-office.de>
MIME-Version: 1.0
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
Date: Thu Apr  4 04:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2002-04-04 at 11:18, Holger Rauch wrote:

> 
> What's the maximum hard drive space a 2.4.18 kernel is able to see without
> the IDE patch applied? 

like 134 GB or so I think., here my kernel boot msg withouth the patch:

Apr  1 21:18:26 dumbo hdc: 268435455 sectors (137439 MB) w/2048KiB
Cache, CHS=266305/16/63, UDMA(100)

with:

Apr  4 10:24:13 dumbo hdc: 320173056 sectors (163929 MB) w/2048KiB
Cache, CHS=19929/255/63, UDMA(100)

> Where did you get this IDE patch from?

http://www.kernel.org/pub/linux/kernel/people/hedrick/ide-2.4.18/

enjoy

Christophe
-- 
Christophe Zwecker
:Sysctl				
Susannenstr. 26-28		
20357 Hamburg			
phon/fax: +49 40 43099296/7		
mail: czwecker@sysctl.de
