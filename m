Date: Wed, 13 Oct 1999 17:44:11 +0100 (BST)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] kernel 2.2.10 patching
In-Reply-To: <H00004e90305d0a1@MHS>
Message-ID: <Pine.LNX.4.10.9910131743360.6508-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Smith <Al.Smith@mail.tju.edu>
Cc: linux-lvm@msede.com

You need to do 

patch -p1 < /download/patch-2.2.10-LVM

because patch expects stuff from stdin.

James

On Wed, 13 Oct 1999, Al Smith wrote:

> Greetings,
> 
>   I am trying to patch a already installed 2.2.10 kernel with the patch
> from msede. I downloaded the file (which doesn't put it into gz
> formating).
> 
>   Then I cd /usr/src/linux
> 
> then I do:
> 
> patch -p1 /download/patch-2.2.10-LVM
> 
> and it just sits there. Is there a problem with the patch?
> 
> Al Smith
> Systems Engineer
> TJUH
> al.smith@mail.tju.edu
> 
