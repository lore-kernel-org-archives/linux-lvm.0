Message-ID: <1519.24.46.54.254.1031935361.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
In-Reply-To: <3D820EB3.5060801@comedia.it>
References: <2100.24.46.54.254.1031670341.squirrel@mail.scottsavarese.com>
        
        
        
        
        
        
        
        <3D7E0CC0.D7B06D44@silicide.dk>
        
        
        
        
        
        
        
        <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>
        
        
        
        
        
        
        
        <20020911080049.GA28187@gw.silicide.dk>
        <1596.24.46.54.254.1031862235.squirrel@mail.scottsavarese.com>
        <3D820EB3.5060801@comedia.it>
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
Date: Fri Sep 13 11:46:17 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Luca Berra said:
> which problems did you find in putting / (or /boot) on LVM over MD? (btw
> i am running such a setup)

Lilo has been completely unable to figure out where my root and boot
partitions are. No matter how I was setting up lilo.conf, it wouldn't find
the lvm root partition. I would get L 80 80 80... or L 40 40 40. Sadly, I
never kept a log of exactly what I did (it would have been helpful). I
have a feeling it was more a problem with setting up the raid and getting
lilo to understand where everything is as opposed to an issue with lvm.

>
>> Is there a howto out there on how to combine raid and lvm? Is there a
>> need
> not that i know of
>> to write one?
> probably yes

Once I figure it all out I'll try and write one...

Scott
