Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2985C4.BA9F7D76@tls.msk.ru>
Date: Sun, 03 Dec 2000 02:29:08 +0300
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from 
 /dev/raw/...
References: <3A296084.337D6ECA@freeler.nl>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jorg de Jong wrote:
> 
> Hi,
> 
> your mail trigged me to try this on my system!
> 
> SQL> create tablespace x datafile '/dev/raw/raw1' ;
> create tablespace x datafile '/dev/raw/raw1'
> 
> Tablespace created.
> 
> and I did not have any problems what so ever!
> my setup is :
> - rh7.0
> - 2.4.11 stock kernel with

What's the "2.4.11" kernel?  I think that there is no
such beast exists, and will not exists for at least
some months...  There is only 2.4testN, i.e. pre-2.4.
Redhat 7.0 ships with something like 2.2.16-22, and
included 2.4-0.something -- maybe this is what you
have?  And maybe things go well on 2.4-tobe kernel?
(I tried with 2.2.17, 2.4 is still not an option for
our applications).

> - plain old LVM 8.0 (usertools patched)
> - Oracle is 8.1.6 SE
> 

Regards,
 Michael.
