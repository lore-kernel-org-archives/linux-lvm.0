Return-Path: <jeffrey.hundstad@mnsu.edu>
Message-ID: <3AE05698.26B862D8@mnsu.edu>
Date: Fri, 20 Apr 2001 10:32:40 -0500
From: Jeffrey Hundstad <jeffrey.hundstad@mnsu.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and DRDB
References: <20010420111022.C6133@cistron.nl>
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

What will you be using as a filesystem for your 5TB server.  EXT2 isn't
much fun on our 1TB server ;-)

--
jeffrey hundstad

Wichert Akkerman wrote:

> Does anyone know if LVM will work correctly on top of DRDB? I
> need to keep an off-site copy of a 5TB fileserver synchronized
> and that might be an usefull approach.
>
> Wichert.
>
> --
>    ________________________________________________________________
>  / Generally uninteresting signature - ignore at your convenience  \
> | wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
> | 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
