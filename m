From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14324.58266.920834.895229@dukat.scot.redhat.com>
Date: Fri, 1 Oct 1999 17:38:50 +0100 (BST)
Subject: Re: [linux-lvm] LVM, raw-io, devfs
In-Reply-To: <006201bf0bb7$6eae4a60$030116ac@fd1>
References: <006201bf0bb7$6eae4a60$030116ac@fd1>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Fernando Dammous <ferdam@internetcom.com.br>
Cc: Linux LVM msede <linux-lvm@msede.com>, Stephen Tweedie <sct@redhat.com>

Hi,

On Thu, 30 Sep 1999 23:48:23 -0300, "Fernando Dammous"
<ferdam@internetcom.com.br> said:

> Now, I would like to install the devfs and mainly the raw-io.   
  
> Can I install them in a kernel 2.0.36, which is already patched with
> LVM?

I've never tried the raw IO code on 2.0: let me know how it goes!  In
principle, there is no reason why raw IO on LVM should not work.

--Stephen
