From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14326.7775.34828.234038@dukat.scot.redhat.com>
Date: Sat, 2 Oct 1999 16:01:51 +0100 (BST)
Subject: Re: [linux-lvm] LVM, raw-io, devfs
In-Reply-To: <37F4FFCD.6AE2EC3E@mainland.ab.ca>
References: <006201bf0bb7$6eae4a60$030116ac@fd1>
	<14324.58266.920834.895229@dukat.scot.redhat.com>
	<37F4FFCD.6AE2EC3E@mainland.ab.ca>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Drew Smith <drew@winterland.mainland.ab.ca>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, linux-lvm@msede.com

Hi,

On Fri, 01 Oct 1999 12:39:09 -0600, Drew Smith
<drew@winterland.mainland.ab.ca> said:

> 	Now, I've just got to find a Linux-HSM(**) project to control my
> optical jukebox. :)  Any ideas whether this exists?

Not yet, but XFS has all of the support necessary for us to do a
kernel DMAPI implementation, which would open up all sorts of HSM
possibilities. 

--Stephen
