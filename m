Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 2 Feb 2001 10:20:00 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] startup stuff
Message-ID: <20010202102000.C479@tykepenguin.com>
References: <Pine.LNX.4.21.0102020959490.426-100000@munster.noc.fr.clara.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0102020959490.426-100000@munster.noc.fr.clara.net>; from james@fr.clara.net on Fri, Feb 02, 2001 at 10:02:17AM +0100
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

On Fri, Feb 02, 2001 at 10:02:17AM +0100, JAmes wrote:
> 
> Hello
> 
> I am using debian Linux, and have farely successfully installed LVM. I
> have just to do the lvcreate -ay at startup. I assume that thi smust go in
> 
> /etc/rc2.d 
> 
> but using what S??
> 

So long as it's before anything that uses the volumes you have on LVM you should
be OK. I would be tempted to put it in at 15, ie after kerneld and before NFS
and anacron.

patrick
