Return-Path: <jes@lxplus015.cern.ch>
Subject: Re: [linux-lvm] LVM and DRDB
References: <20010420111022.C6133@cistron.nl> <200104201031.f3KAVT05030575@webber.adilger.int> <20010420123624.F13067@cistron.nl>
From: Jes Sorensen <jes@linuxcare.com>
Date: 20 Apr 2001 15:37:34 +0200
In-Reply-To: Wichert Akkerman's message of "Fri, 20 Apr 2001 12:36:24 +0200"
Message-ID: <d3y9svheu9.fsf@lxplus015.cern.ch>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wichert Akkerman <wichert@cistron.nl>
Cc: linux-lvm@sistina.com, linux-openlvm@nl.linux.org

>>>>> "Wichert" == Wichert Akkerman <wichert@cistron.nl> writes:

Wichert> Previously Andreas Dilger wrote:
>> Hopefully you have some sort of journaled filesystem for this?

Wichert> Either ext3 or reiserfs, depending on the kernel we
Wichert> use. Doing a fsck on 5TB of data is not something I would
Wichert> enjoy doing :)

For a file system that size you might want to look at XFS instead.

Jes
