Subject: Re: [linux-lvm] lvm2 and xfs (repost)
Message-ID: <1054891523.3ee05e03b3e6f@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <200306061044.50925.krienke@uni-koblenz.de>
In-Reply-To: <200306061044.50925.krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Jun  6 04:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Rainer Krienke <krienke@uni-koblenz.de>:

> It seems this message I posted some days ago did not reach the list. So
> I 
> repost ist one more time. Sorry if anyone should receive it twice.
> 
> Hello,
> 
> since I have trouble with lvm1 in a linux san environment with a
> multipath  
> configuration I wanted to give  lvm2 a try. So I downloaded a plain
> 2.4.20 
> kernel and patched the devicemapper (latest stable version) and then I
> wanted 
> to apply xfs patches since I want to use xfs. It seems that the
> devicemapper 
> and xfs are not yet compatible. No matter which patch I appply first I
> have 
> one file (/linux/fs/buffer.c) where either of the patches will fail if
> the 
> other one has already been applied. 
> 
> Is there anyone running lvm2 with xfs? If yes what configuration do you
> use? 
> What kernel should I use to get both  working (in a stable fashion)? 
> 
> Any comments?

why not go for a recent -ac kernel and skip patching :)
( in -ac are included both xfs and dm )

and someone posted a dm-patch against xfs kernel on the list

i'm using lvm1 & xfs ( and i really wanted to check lvm2) but because 
xfs, devmaper & soft raid do not work all together i'm staing with lvm1 :(

best,

Svetljo 
