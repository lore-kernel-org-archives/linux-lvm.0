Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Wed, 11 Jul 2001 14:20:51 -0500
Subject: Re: [linux-lvm] about to give up
Message-ID: <265770000.994879251@duke.wrkhors.com>
In-Reply-To: <20010711134123.D1863@zendo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


-- Eli Criffield <eli@zendo.net> on 07/11/01 13:41:23 -0500

>> try:
>> 
>>     vgexport blah;
>>     vgimport blah PV PV PV;
>> 
> 
> I can't export it because it doesn't know it exists because vgscan can't
> find it.

Peachy.  Now just try vgimporting it.  The PV's themselves
may have sufficient metadata to get away with it.

sl
