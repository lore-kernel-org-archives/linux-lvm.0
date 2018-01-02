References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
From: Gordon Messmer <gordon.messmer@gmail.com>
Message-ID: <cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
Date: Tue, 2 Jan 2018 07:35:50 -0800
MIME-Version: 1.0
In-Reply-To: <e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------65EEE3E2938AD636416F8E93"
Content-Language: en-US
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------65EEE3E2938AD636416F8E93
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 01/02/2018 03:03 AM, Marian Csontos wrote:
> Filters accept any device if any of it's "names" (all symbolic links) 
> is matched by an a pattern ("a|.*/|" in your case) and matches no 
> previous r pattern

I don't follow you.  The name being processed in that log *does* match a 
previous r pattern.

> for example anything in /dev/mapper/ is accepted. 


Yes, I'd considered that might be an issue, but that's not the block 
device name that the logs indicate is being used.  A path that I've 
specifically rejected is being processed.  If a second path to the block 
device might be processed, then I can see the need to make additional 
changes, but I can't solve that problem without understanding the basic 
logic of the filter system.

The documentation in lvm.conf says "The first regex in the list to match 
the path is used, producing the 'a' or 'r' result for the device." but 
that doesn't seem to be correct.


--------------65EEE3E2938AD636416F8E93
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/02/2018 03:03 AM, Marian Csontos
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com">Filters
      accept any device if any of it's "names" (all symbolic links) is
      matched by an a pattern ("a|.*/|" in your case) and matches no
      previous r pattern</blockquote>
    <br>
    I don't follow you.  The name being processed in that log *does*
    match a previous r pattern.<br>
    <br>
    <blockquote type="cite"
      cite="mid:e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com">for
      example anything in <i class="moz-txt-slash"><span
          class="moz-txt-tag">/</span>dev/mapper<span
          class="moz-txt-tag">/</span></i> is accepted.
    </blockquote>
    <p><br>
    </p>
    <p>Yes, I'd considered that might be an issue, but that's not the
      block device name that the logs indicate is being used.  A path
      that I've specifically rejected is being processed.  If a second
      path to the block device might be processed, then I can see the
      need to make additional changes, but I can't solve that problem
      without understanding the basic logic of the filter system.  <br>
    </p>
    <p>The documentation in lvm.conf says "The first regex in the list
      to match the path is used, producing the 'a' or 'r' result for the
      device." but that doesn't seem to be correct.<br>
      <br>
    </p>
  </body>
</html>

--------------65EEE3E2938AD636416F8E93--
