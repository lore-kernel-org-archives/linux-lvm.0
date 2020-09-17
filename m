References: <863EB246-CED9-463B-8D52-5A15197A8ABC@gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <f4b822a0-33d2-bd9b-6696-09d09aa19052@redhat.com>
Date: Thu, 17 Sep 2020 17:21:58 +0200
MIME-Version: 1.0
In-Reply-To: <863EB246-CED9-463B-8D52-5A15197A8ABC@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------6C57BC2E58BDC7E8A8E063CD"
Content-Language: en-US
Subject: Re: [linux-lvm] size of lvm metadata
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com, tomas.dalebjork@gmail.com

This is a multi-part message in MIME format.
--------------6C57BC2E58BDC7E8A8E063CD
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Tomas,

the first PE starts at offset 2048 sectors of size 512 bytes by default, 
i.e. the LVM MDA (metadata area)
is ~1MiB big (because the MDA starts at offset 1 page into the device).  
If you plan for large numbers of LVs or expect very scattered 
allocations which both grow the metadata, you may want to create a
bigger MDA using vgcreate's option --metadatasize (also see 
/etc/lvm/lvm.conf description on
metadata/pvmetadatasize).

On 9/16/20 5:50 PM, Tomas Dalebjörk wrote:
> hi  > > I am trying to understand how big the lvm metadata is > > in the 
vgcfgbackup file, I can see extent_size = 8192 dev_size = > 204800 
pe_start = 2048 pe_count 24 > > pe_count(24) * extent_size(8192) = 
196608 bytes usable space of the > total dev_size(204800) metadata size? 
= dev_size(204800) - 196608 = > 8192 > > but... pe_start is 2048? so 
what is pe_start here? cant be > sectors(512)? bytes? well than ther be 
not aligned > > so where starts the actual data? and where ends the lvm 
metadata?

At offset 2048 sectors (1MiB into the device) / MDA ends at sector 2047.

Mind that lvm2 metadata is text formatted (see /etc/lvm/backup/$VGName 
for one)
and thus varies in size (the MDA is used as a ring buffer for 2 copies 
of the MDA to
support atomic updates).  As pointed out above when refering to 
'vgcreate --metadatasize',
in more elaborate setups you may run out of MDA space.

Heinz

>  > regards Tomas Sent from my iPhone > > > 
_______________________________________________ linux-lvm mailing > list 
linux-lvm@redhat.com > https://www.redhat.com/mailman/listinfo/linux-lvm 
read the LVM HOW-TO > at http://tldp.org/HOWTO/LVM-HOWTO/

--------------6C57BC2E58BDC7E8A8E063CD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Tomas,<br>
    <br>
    the first PE starts at offset 2048 sectors of size 512 bytes by
    default, i.e. the LVM MDA (metadata area)<br>
    is ~1MiB big (because the MDA starts at offset 1 page into the
    device).  If you plan for large numbers of LVs or expect very
    scattered allocations which both grow the metadata, you may want to
    create a<br>
    bigger MDA using vgcreate's option --metadatasize (also see
    /etc/lvm/lvm.conf description on<br>
    metadata/pvmetadatasize).<br>
    <br>
    On 9/16/20 5:50 PM, Tomas Dalebjörk wrote:<br>
    <span style="white-space: pre-wrap; display: block; width: 98vw;">&gt; hi
&gt; 
&gt; I am trying to understand how big the lvm metadata is
&gt; 
&gt; in the vgcfgbackup file, I can see extent_size = 8192 dev_size =
&gt; 204800 pe_start = 2048 pe_count 24
&gt; 
&gt; pe_count(24) * extent_size(8192) = 196608 bytes usable space of the
&gt; total dev_size(204800) metadata size? = dev_size(204800) - 196608 =
&gt; 8192
&gt; 
&gt; but... pe_start is 2048? so what is pe_start here? cant be
&gt; sectors(512)? bytes? well than ther be not aligned
&gt; 
&gt; so where starts the actual data? and where ends the lvm metadata?
</span>
    <p>At offset 2048 sectors (1MiB into the device) / MDA ends at
      sector 2047.<br>
      <br>
      Mind that lvm2 metadata is text formatted (see
      /etc/lvm/backup/$VGName for one)<br>
      and thus varies in size (the MDA is used as a ring buffer for 2
      copies of the MDA to<br>
      support atomic updates).  As pointed out above when refering to
      'vgcreate --metadatasize',<br>
      in more elaborate setups you may run out of MDA space.<br>
    </p>
    <p>Heinz<br>
    </p>
    <span style="white-space: pre-wrap; display: block; width: 98vw;">&gt; 
&gt; regards Tomas Sent from my iPhone
&gt; 
&gt; 
&gt; _______________________________________________ linux-lvm mailing
&gt; list <a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a> 
&gt; <a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a> read the LVM HOW-TO
&gt; at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</span><br>
  </body>
</html>

--------------6C57BC2E58BDC7E8A8E063CD--
