Return-Path: <glenn@gecpalau.com>
Message-ID: <3AEBF85F.8EC404@gecpalau.com>
Date: Sun, 29 Apr 2001 20:17:51 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segfault at boot with vgscan and linux 2.4.4 kernel
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

Hi all (again!),

Just got done compiling my new 2.4.4 kernel using the same options as
before and now at boot vgscan is segfaulting......

Anyone else have this problem?

Tried recompiling the lvm tools....no dice. Still segfaulting...

Tried recompiling my kernel with pgcc and no dice (wont finish
compiling....complains a bunch and error 2s out on the make bzImage
phase...modules compile fine tho (wierd).

Tried updating my binutils and recompiling....no luck there either.

Thanks!


Glenn
