Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 9 May 2001 15:43:48 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Patching my kernel.
Message-ID: <20010509154348.H520@tykepenguin.com>
References: <989363474.1329.2.camel@localhost> <20010509085110.G23157@colombina.comedia.it> <989404772.3725.0.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <989404772.3725.0.camel@localhost>; from raheesom@navpoint.com on Wed, May 09, 2001 at 06:39:31AM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 09, 2001 at 06:39:31AM -0400, Rupert Heesom wrote:
> 
> BTW, I know there's a way to keep the config from the "used kernel", so
> that I don't have to guess the settings again for my system (I made
> several config errors last time).  Can you remind me how to migrate the
> .config file across to a new source tree?   I'll try & find some docs on
> how to do this, but have forgotten where I last read about it.
> 

Copy the .config file from the old kernel tree into the new one and type

make oldconfig

You'll get asked questions about any new options that have appeared in this
kernel release.

patrick
