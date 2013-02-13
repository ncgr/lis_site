$j(function($) {

  var dates = $("#start_date, #end_date").datepicker({
    changeMonth: true,
    numberOfMonths: 2,
    dateFormat: 'yy-mm-dd',
    onSelect: function(selectedDate) {
      var option = this.id == "start_date" ? "minDate" : "maxDate",
      instance = $(this).data("datepicker"),
      date = $.datepicker.parseDate(
        instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
        selectedDate,
        instance.settings
      );
      dates.not(this).datepicker("option", option, date);
    }
  });

  $('#logo_left').click(function() {
    document.location.pathname='/';
  });

  $('form').submit(function() {
    $('input[type=submit]', this).val('Processing...').attr(
      'disabled', 'disabled'
    );
  });

  $(window).unload(function() {
    $('input[type=submit]', 'form').val('Submit').removeAttr('disabled');
  });

  if ($("#phylogenetic-tree").length !== 0) {
    var newickData = "((((((Glycine_max:0.20,((Phaseolus_vulgaris:0.02,Phaseolus_coccineus:0.02):0.13,(Vigna_unguiculata:0.02,Vigna_radiata:0.02):0.13):0.05):0.05,Cajanus_cajan:0.25):0.05,(((((Medicago_truncatula:0.02,Medicago_sativa:0.02):0.08,Trifolium_pratense:0.10):0.05,(Vicia_faba:0.10,(Lens_culinaris:0.05,Pisum_sativum:0.05):0.05):0.05):0.05,Cicer_arietinum:0.20):0.05,Lotus_japonicus:0.25):0.05):0.05,Arachis_hypogaea:0.35):0.05,(Lupinus_albus:0.02,Lupinus_angustifolius:0.02):0.38):0.05,Chamaecrista_fasciculata:0.45);";
    drawTreeNew(new jsGraphics("phylogenetic-tree"), parseNewickSpecies(newickData));
  }
});
